using JsonCompareLib;
using Newtonsoft.Json.Linq;
using ObjectDiffDemo.CompareService;
using System;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Serialization;
using System.Xml.Xsl;
namespace ObjectDiffDemo
{
	public partial class CompareObjects : Page
	{
		protected TextBox textBoxTableNameSource;
		protected ListBox listBoxSourceEnrionment;
		protected TextBox textBoxQuerySource;
		protected ListBox listBoxDestEnrionment;
		protected TextBox textBoxQueryDest;
		protected Button buttonCompare;
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!base.IsPostBack)
			{
				this.BindData();
			}
		}
		protected void buttonCompare_Click(object sender, EventArgs e)
		{
			string tableName = this.textBoxTableNameSource.Text.Trim();
			string sourceUrl = this.listBoxSourceEnrionment.SelectedValue;
			string sourceQuery = this.textBoxQuerySource.Text.Trim();
			string destUrl = this.listBoxDestEnrionment.SelectedValue;
			string destQuery = this.textBoxQueryDest.Text.Trim();
			string originalJson = this.GetJsonString(tableName, sourceQuery, sourceUrl);
			string newJson = this.GetJsonString(tableName, destQuery, destUrl);
			JObject jobject = JObject.Parse(originalJson);
			JObject jobject2 = JObject.Parse(newJson);
			CompareHandler handler = new CompareHandler();
			CompareStruct compareResult = handler.CompareStruct(jobject, jobject2);
			string diffXML_temp = compareResult.ToXML("instance");
			XmlDocument xmlDocument = new XmlDocument();
			XmlElement rootElement = xmlDocument.CreateElement("model");
			rootElement.InnerXml = diffXML_temp;
			string diffXML = rootElement.OuterXml;
			string xslContent = this.GetXSL(tableName);
			string resultHTML = this.XslTransform(diffXML, xslContent);
            //Show the result html to the iframe
            //Only the brower supports HTML5 can show it correctly.
			this.iframeResult.Attributes["srcdoc"] = resultHTML;
		}

        /// <summary>
        /// Bind the enrionments to listbox.
        /// </summary>
		private void BindData()
		{
            //Add 2 to source list
			this.listBoxSourceEnrionment.Items.Add(new ListItem("MDEV", "http://psmadv01.edev.elabs.eds.com:47002/SM/7/ws"));
			this.listBoxSourceEnrionment.Items.Add(new ListItem("Testing", "http://eitsmapv102.eit.ssn.hp.com:47002/SM/7/ws"));

            //Add 2 to destination list
			this.listBoxDestEnrionment.Items.Add(new ListItem("MDEV", "http://psmadv01.edev.elabs.eds.com:47002/SM/7/ws"));
            this.listBoxDestEnrionment.Items.Add(new ListItem("Testing", "http://eitsmapv102.eit.ssn.hp.com:47002/SM/7/ws"));
		}
		private void SetHtml(string htmlText)
		{
			base.ClientScript.RegisterStartupScript(this.Page.GetType(), "open", "UpdateHtml('" + htmlText + "')", true);
		}
		private string GetJsonString(string tableName, string queryString, string webserviceUrl)
		{
            string webServiceUser = "ASIAPACIFIC_DAIZHEN";
            string webServicePwd = "";
			SaveCompareServiceRequest request = new SaveCompareServiceRequest();
			request.model = new CompareServiceModelType();
			request.model.keys = new CompareServiceKeysType();
			request.model.instance = new CompareServiceInstanceType();
			request.model.instance.Name = new StringType
			{
				Value = tableName
			};
			request.model.instance.QueryString = new StringType
			{
				Value = queryString
			};
            ObjectDiffDemo.CompareService.CompareService compareService = new ObjectDiffDemo.CompareService.CompareService();
			compareService.Url = webserviceUrl;
			CredentialCache credentialCache = new CredentialCache();
            NetworkCredential credentials = new NetworkCredential(webServiceUser, webServicePwd, "");
			credentialCache.Add(new Uri(compareService.Url), "Basic", credentials);
			compareService.Credentials = credentialCache;
			XmlSerializer ser = new XmlSerializer(request.GetType());
			MemoryStream memstream = new MemoryStream();
			ser.Serialize(memstream, request);
			memstream.Seek(0L, SeekOrigin.Begin);
			byte[] buffer = new byte[memstream.Length];
			memstream.Read(buffer, 0, (int)memstream.Length);
			string requestXML = Encoding.UTF8.GetString(buffer);
			memstream.Close();
			SaveCompareServiceResponse response = compareService.SaveCompareService(request);
			return response.model.instance.Content.Value;
		}
		private string GetXSL(string tableName)
		{
			string xslFileName = base.Server.MapPath(HttpContext.Current.Request.ApplicationPath.ToString()) + "\\XSL_Files\\" + tableName + ".xsl";
			FileStream fileStream = new FileStream(xslFileName, FileMode.Open, FileAccess.Read);
			string result;
			using (fileStream)
			{
				StreamReader reader = new StreamReader(fileStream);
				result = reader.ReadToEnd();
			}
			return result;
		}

        /// <summary>
        /// Transform xml string by the given xsl 
        /// </summary>
        /// <param name="inputXmlConent"></param>
        /// <param name="inuptXslContent"></param>
        /// <returns></returns>
		private string XslTransform(string inputXmlConent, string inuptXslContent)
		{
			XmlReader readerXml = XmlReader.Create(new MemoryStream(Encoding.UTF8.GetBytes(inputXmlConent)));
			XmlReader readerXsl = XmlReader.Create(new MemoryStream(Encoding.UTF8.GetBytes(inuptXslContent)));
			XslCompiledTransform transform = new XslCompiledTransform();
			transform.Load(readerXsl, new XsltSettings
			{
				EnableScript = true
			}, new XmlUrlResolver());
			StringBuilder sb = new StringBuilder();
			XmlWriterSettings Settings = new XmlWriterSettings
			{
				Indent = true,
				ConformanceLevel = ConformanceLevel.Auto
			};
			XmlWriter writer = XmlWriter.Create(sb, Settings);
			transform.Transform(readerXml, writer);
			return sb.ToString();
		}
	}
}
