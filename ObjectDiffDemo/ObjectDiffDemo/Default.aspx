<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ObjectDiffDemo.CompareObjects" %>

<body>
    <form runat="server">
        <script type="text/javascript">            function UpdateHtml(html) {
                document.getElementById("iframeResult").srcdoc = html;
            }    </script>
        <div>
            <span>Table Name:</span>
            <asp:TextBox runat="server" ID="textBoxTableNameSource"></asp:TextBox>
            <br />
            <span>Source Enrionment:</span>
            <asp:ListBox runat="server" ID="listBoxSourceEnrionment" Rows="1"></asp:ListBox>
            <span>Query String:</span>
            <asp:TextBox runat="server" ID="textBoxQuerySource"></asp:TextBox>
            <br />
            <span>Dest Enrionment:</span>
            <asp:ListBox runat="server" ID="listBoxDestEnrionment" Rows="1"></asp:ListBox>
            <span>Query String:</span>
            <asp:TextBox runat="server" ID="textBoxQueryDest"></asp:TextBox>
            <br />
            <asp:Button ID="buttonCompare" runat="server" Text="Compare" OnClick="buttonCompare_Click" />
            <br />
            <iframe width="1200" id="iframeResult" runat="server" height="600"></iframe>
        </div>
    </form>
</body>
