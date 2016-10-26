using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web;

namespace JsonCompareLib
{
    public class LineDiff
    {
        public Collection<MultiLineDiff> Diff(string originalStr, string newStr)
        {
            Regex reg = new Regex(@"\r?\n");
            string[] originalLines = reg.Split(originalStr);
            if (string.IsNullOrEmpty(originalStr))
            {
                originalLines = new string[0];
            }
            string[] newLines = reg.Split(newStr);
            if (string.IsNullOrEmpty(newStr))
            {
                newLines = new string[0];
            }

            Collection<MultiLineDiff> trances = new Collection<MultiLineDiff>();

            int[][] tracesMatrix = new int[originalLines.Length + 1][];
            //Init matrix
            for (int i = 0; i < originalLines.Length + 1; i++)
            {
                tracesMatrix[i] = new int[newLines.Length + 1];
                for (int j = 0; j < newLines.Length + 1; j++)
                {
                    tracesMatrix[i][j] = -1;
                }
            }

            int minEditLength = MinEditLength(originalLines, newLines, 0, 0, tracesMatrix);
            trances = GetTraces(originalLines, newLines, tracesMatrix);

            string html = GenerateDiffHTML(trances, originalLines, newLines);

            return trances;

        }

        public string CreateDiffHtml(string originalStr, string newStr)
        {
            Regex reg = new Regex(@"\r?\n");
            string[] originalLines = reg.Split(originalStr);
            string[] newLines = reg.Split(newStr);

            Collection<MultiLineDiff> trances = Diff(originalStr, newStr);

            string html = GenerateDiffHTML(trances, originalLines, newLines);

            return html;
        }

        /// <summary>
        /// Get the edit path from diff matrix
        /// </summary>
        /// <param name="originalStrs"></param>
        /// <param name="newStrs"></param>
        /// <param name="buffer"></param>
        /// <returns></returns>
        public Collection<MultiLineDiff> GetTraces(string[] originalStrs, string[] newStrs, int[][] buffer)
        {
            Collection<MultiLineDiff> trances = new Collection<MultiLineDiff>();

            int y  = buffer.Length - 1;
            int x = buffer[0].Length - 1;

            while (x > 0 && y > 0)
            {
                int currentValue = buffer[y][x];
                int addLength = buffer[y][x - 1] + 1;
                int deleteLength = buffer[y - 1][x] + 1;
                int updateLength = buffer[y - 1][x - 1] + (TrimCompare(originalStrs[y -1 ], newStrs[x -1])?0:1);
                MultiLineDiff diffItem = new MultiLineDiff();
                diffItem.NewLine = x - 1;
                diffItem.OriginalLine = y - 1;
                if (currentValue == addLength)
                {
                    diffItem.ChangeType = 1;
                    x--;
                }
                else if (currentValue == deleteLength)
                {
                    diffItem.ChangeType = -1;
                    y--;
                }
                else
                {
                    if (TrimCompare(originalStrs[y - 1], newStrs[x - 1]))
                    {
                        diffItem.ChangeType = 0;
                    }
                    else
                    {
                        diffItem.ChangeType = 2;
                    }
                    y--;
                    x--;
                }

                trances.Insert(0, diffItem);
            }
            if (x == 0)
            {
                while (y != 0)
                {
                    MultiLineDiff diffItem = new MultiLineDiff();
                    diffItem.ChangeType = -1;
                    diffItem.NewLine = -1;
                    diffItem.OriginalLine = y - 1;
                    trances.Insert(0, diffItem);
                    y--;
                }

            }
            else if (y == 0)
            {
                while (x != 0)
                {
                    MultiLineDiff diffItem = new MultiLineDiff();
                    diffItem.ChangeType = 1;
                    diffItem.NewLine = x - 1;
                    diffItem.OriginalLine = -1;
                    trances.Insert(0, diffItem);
                    x--;
                }
 
            }

            //while (y < buffer.Length - 1 && x < buffer[0].Length - 1)
            //{
            //    MultiLineDiff diffItem = new MultiLineDiff();
            //    diffItem.NewLine = x;
            //    diffItem.OriginalLine = y;

            //    int currentValue = buffer[y][x];

            //    int addLength = buffer[y][x + 1];
            //    int deleteLength = buffer[y + 1][x];
            //    int updateLength = buffer[y + 1][x + 1];

            //    if (currentValue == addLength + 1)
            //    {
            //        diffItem.ChangeType = 1;
            //        x++;
            //    }
            //    else if (currentValue == deleteLength + 1)
            //    {
            //        diffItem.ChangeType = -1;
            //        y++;
            //    }
            //    else
            //    {
            //        if (TrimCompare(originalStrs[y] , newStrs[x]))
            //        {
            //            diffItem.ChangeType = 0;
            //        }
            //        else
            //        {
            //            diffItem.ChangeType = 2;
            //        }
            //        x = x + 1;
            //        y = y + 1;
            //    }
            //    trances.Add(diffItem);
            //}

            //if (y == buffer.Length - 1)
            //{
            //    //Add
            //    while (x < newStrs.Length)
            //    {
            //        MultiLineDiff diffItem = new MultiLineDiff();
            //        diffItem.NewLine = x;
            //        diffItem.OriginalLine = -1;
            //        diffItem.ChangeType = 1;

            //        trances.Add(diffItem);
            //        x++;
            //    }
            //}
            //else if (x == buffer[0].Length - 1)
            //{
            //    //delete
            //    while (y < originalStrs.Length)
            //    {
            //        MultiLineDiff diffItem = new MultiLineDiff();
            //        diffItem.NewLine = -1;
            //        diffItem.OriginalLine = y;
            //        diffItem.ChangeType = -1;
            //        trances.Add(diffItem);
            //        y++;
            //    }
            //}
            return trances;
        }

        /// <summary>
        /// Compute edit distance
        /// </summary>
        /// <param name="originalStrs">Original multi line text</param>
        /// <param name="newStrs">Destination multi line text</param>
        /// <param name="originalIndex">Source index</param>
        /// <param name="newIndex">Dest index</param>
        /// <param name="buffer">matrix to store the intermidiate values</param>
        /// <returns></returns>
        public int MinEditLength(string[] originalStrs, string[] newStrs, int originalIndex, int newIndex, int[][] buffer)
        {

            //Define premitive values

            for (var i = 0; i < originalStrs.Length + 1; i++)
            {
                buffer[i][0] = i;
            }

            for (var i = 0; i < newStrs.Length + 1; i++)
            {
                buffer[0][i] = i;
            }
            for (var i = 1; i < originalStrs.Length + 1; i++)
            {
                for (var j = 1; j < newStrs.Length + 1; j++)
                {
                    var add = buffer[i - 1][j] + 1;
                    var del = buffer[i][j - 1] + 1;
                    var update = buffer[i - 1][j - 1] + (TrimCompare(newStrs[j - 1], originalStrs[i - 1]) ? 0 : 1);
                    buffer[i][j] = Math.Min(add, Math.Min(del, update));
                }
            }

            return buffer[originalStrs.Length][newStrs.Length];

            //if (originalIndex == originalStrs.Length && newIndex == newStrs.Length)
            //{
            //    buffer[originalIndex][newIndex] = 0;
            //    return 0;
            //}

            //if (originalIndex == originalStrs.Length)
            //{
            //    // Add
            //    buffer[originalIndex][newIndex] = newStrs.Length - newIndex;
            //    return newStrs.Length - newIndex;
            //}

            //if (newIndex == newStrs.Length)
            //{
            //    //Deleted
            //    buffer[originalIndex][newIndex] = originalStrs.Length - originalIndex;
            //    return originalStrs.Length - originalIndex;
            //}

            //if (buffer[originalIndex][newIndex] >= 0)
            //{
            //    return buffer[originalIndex][newIndex];
            //}
            //else
            //{
            //    int minLength = 0;
            //    if (originalStrs[originalIndex] == newStrs[newIndex])
            //    {
            //        //Not change length
            //        int lengthNonChanged = MinEditLength(originalStrs, newStrs, originalIndex + 1, newIndex + 1, buffer);

            //        //Min length if delete it
            //        int lengthDelete = MinEditLength(originalStrs, newStrs, originalIndex + 1, newIndex, buffer) + 1;

            //        //Min length if add it
            //        int lengthAdd = MinEditLength(originalStrs, newStrs, originalIndex, newIndex + 1, buffer) + 1;

            //        int minTem = Math.Min(lengthNonChanged, lengthDelete);
            //        if (minTem == lengthNonChanged)
            //        {
            //            minLength = lengthNonChanged;
            //        }
            //        else
            //        {
            //            minLength = lengthDelete;
            //        }

            //        if (Math.Min(minTem, lengthAdd) == lengthAdd)
            //        {
            //            minLength = lengthAdd;
            //        }

            //    }
            //    else
            //    {
            //        //Min length if update  it
            //        int lengthEdit = MinEditLength(originalStrs, newStrs, originalIndex + 1, newIndex + 1, buffer) + 1;
            //        //Min length if delete it
            //        int lengthDelete = MinEditLength(originalStrs, newStrs, originalIndex + 1, newIndex, buffer) + 1;

            //        //Min length if add it
            //        int lengthAdd = MinEditLength(originalStrs, newStrs, originalIndex, newIndex + 1, buffer) + 1;

            //        int minTem = Math.Min(lengthEdit, lengthDelete);
            //        if (minTem == lengthEdit)
            //        {
            //            minLength = lengthEdit;
            //        }
            //        else
            //        {
            //            minLength = lengthDelete;
            //        }

            //        if (Math.Min(minTem, lengthAdd) == lengthAdd)
            //        {
            //            minLength = lengthAdd;
            //        }
            //    }
            //    buffer[originalIndex][newIndex] = minLength;

            //    return minLength;
            //}
        }
        private bool TrimCompare(string v1, string v2)
        {
            if (string.IsNullOrEmpty(v1) && string.IsNullOrEmpty(v2))
            {
                return true;
            }
            if (string.IsNullOrEmpty(v1) || string.IsNullOrEmpty(v2))
            {
                return false;
            }

            return v1.Trim() == v2.Trim();
        }

        public string GenerateDiffHTML(Collection<MultiLineDiff> trances, string[] originalStrs, string[] newStrs)
        {
            StringBuilder htmlStr = new StringBuilder();

            htmlStr.Append("<table width='100%'>");
            foreach (MultiLineDiff diffItem in trances)
            {
                htmlStr.Append("<tr>");
                if (diffItem.ChangeType == 0)
                {
                    htmlStr.Append("<td width='50%'>").Append(EscapeHtmlString(originalStrs[diffItem.OriginalLine])).Append("</td>");
                    htmlStr.Append("<td width='50%'>").Append(EscapeHtmlString(newStrs[diffItem.NewLine])).Append("</td>");
                }
                else if (diffItem.ChangeType == 1)
                {
                    htmlStr.Append("<td  width='50%' bgcolor='green'>").Append("&nbsp;").Append("</td>");
                    htmlStr.Append("<td  width='50%' bgcolor='green'>").Append(EscapeHtmlString(newStrs[diffItem.NewLine])).Append("</td>");
                }
                else if (diffItem.ChangeType == -1)
                {
                    htmlStr.Append("<td  width='50%' bgcolor='red'><s>").Append(EscapeHtmlString(originalStrs[diffItem.OriginalLine])).Append("</s></td>");
                    htmlStr.Append("<td  width='50%' bgcolor='red'>").Append("&nbsp;").Append("</td>");
                }
                else
                {
                    htmlStr.Append("<td  width='50%' bgcolor='yellow'>").Append(EscapeHtmlString(originalStrs[diffItem.OriginalLine])).Append("</td>");
                    htmlStr.Append("<td  width='50%' bgcolor='yellow'>").Append(EscapeHtmlString(newStrs[diffItem.NewLine])).Append("</td>");
                }
                htmlStr.Append("</tr>");
            }

            htmlStr.Append("</table>");
            return htmlStr.ToString();
        }
        public string EscapeHtmlString(string rawString)
        {
            return HttpUtility.HtmlEncode(rawString).Replace("\t", "&nbsp;&nbsp;&nbsp;&nbsp;");
        }
    }
}
