using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace JsonCompareLib
{
	public class CompareBasic: IXML
	{
		public ChangeType Type
		{
			get;
			set;
		}

		public string OriginalValue
		{
			get;
			set;
		}

		public string NewValue
		{
			get;
			set;
		}

        public string ToXML(string rootName)
        {
            XmlDocument xmlDocument = new XmlDocument();
            var rootElement = xmlDocument.CreateElement(rootName);

            //var typeElement = xmlDocument.CreateElement("Type");
            //typeElement.InnerText = Type.ToString();

            //var originalValueElement = xmlDocument.CreateElement("OriginalValue");
            //originalValueElement.InnerText = OriginalValue;

            //var newValueElement = xmlDocument.CreateElement("NewValue");
            //newValueElement.InnerText = NewValue;

            //rootElement.AppendChild(typeElement);
            //rootElement.AppendChild(originalValueElement);
            //rootElement.AppendChild(newValueElement);

            if (Type == ChangeType.None)
            {
                rootElement.InnerText = OriginalValue;
            }
            else if (Type == ChangeType.Add)
            {
                rootElement.InnerText = "<div style='background:#00FF00'>" + NewValue + "<div style='background:#00FF00'>";
            }
            else if (Type == ChangeType.Delete)
            {
                rootElement.InnerText = "<s><div style='background:#FF0000'>" + OriginalValue + "</div></s>";
            }
            else
            {
                if (OriginalValue.Contains('\r') || NewValue.Contains('\r') ||
                    OriginalValue.Contains('\n') || NewValue.Contains('\n'))
                {
                    rootElement.InnerText = "<div>" + new LineDiff().CreateDiffHtml(OriginalValue, NewValue) + "</div>";
                }
                else
                {
                    rootElement.InnerText = "<div style='background:#DBDB70'>" + OriginalValue + "<br/> ==><br/>" + NewValue + "</div>";
                }
            }

            return rootElement.OuterXml;
        }
    }
}
