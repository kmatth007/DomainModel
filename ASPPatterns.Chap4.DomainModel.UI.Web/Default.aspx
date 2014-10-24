<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASPPatterns.Chap4.DomainModel.UI.Web._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>
                <h2>Modify this template to jump-start your ASP.NET application.</h2>
            </hgroup>
            <p>
                To learn more about ASP.NET, visit <a href="http://asp.net" title="ASP.NET Website">http://asp.net</a>.
                The page features <mark>videos, tutorials, and samples</mark> to help you get the most from ASP.NET.
                If you have any questions about ASP.NET visit
                <a href="http://forums.asp.net/18.aspx" title="ASP.NET Forum">our forums</a>.
            </p>
        </div>
    </section>


</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>We suggest the following:</h3>
    <ol class="round">
        <li class="one">
            <h5>Getting Started</h5>
            ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            <a href="http://go.microsoft.com/fwlink/?LinkId=245146">Learn more…</a>
        </li>
        <li class="two">
            <h5>Add NuGet packages and jump-start your coding</h5>
            NuGet makes it easy to install and update free libraries and tools.
            <a href="http://go.microsoft.com/fwlink/?LinkId=245147">Learn more…</a>
        </li>
        <li class="three">
            <h5>Find Web Hosting</h5>
            You can easily find a web hosting company that offers the right mix of features and price for your applications.
            <a href="http://go.microsoft.com/fwlink/?LinkId=245143">Learn more…</a>
        </li>
    </ol>

    <div>
    
     <fieldset>
        <legend>Create New Account</legend>
     <p>       
        Customer Ref:
        <asp:TextBox ID="txtCustomerRef" runat="server" />
        <asp:Button ID="btCreateAccount" runat="server" Text="Create Account"
onclick="btCreateAccount_Click" />
    </p>
    </fieldset>
    <fieldset>
        <legend>Account Detail</legend>
        <p>
        <asp:DropDownList AutoPostBack="true" ID="ddlBankAccounts" runat="server"            
              onselectedindexchanged="ddlBankAccounts_SelectedIndexChanged"/ >
        </p>
        <p>
            Account No:
            <asp:Label ID="lblAccountNo" runat="server" />
        </p>
        <p>
            Customer Ref:
            <asp:Label ID=""lblCustomerRef"" runat="server" />
        </p>
        <p>
            Balance:
            <asp:Label ID=""lblBalance"" runat="server" />
        </p>
        <p>
            Amount £<asp:TextBox ID=""txtAmount"" runat="server" Width="60px"/>
            &nbsp;
            <asp:Button ID=""btnWithdrawal"" runat="server" Text="Withdrawal"
                onclick="btnWithdrawal_Click" />
            &nbsp;
            <asp:Button ID=""btnDeposit"" runat="server" Text="Deposit"
                onclick="btnDeposit_Click" />
        </p>
        <p>
            Transfer
            £<asp:TextBox ID=""txtAmountToTransfer"" runat="server"
                          Width="60px" />
        &nbsp;to
        <asp:DropDownList AutoPostBack="true" 
              ID=""ddlBankAccountsToTransferTo"" runat="server"/>
        &nbsp;
         <asp:Button ID=""btnTransfer"" runat="server" Text="Commit"
                onclick="btnTransfer_Click" />
        </p>
        <p>
            Transactions</p>
            <asp:Repeater ID=""rptTransactions"" runat="server">
                <HeaderTemplate>
                    <table>
                    <tr>
                        <td>deposit</td>
                        <td>withdrawal</td>
                        <td>reference</td>
                    </tr>
                </HeaderTemplate> 
                <ItemTemplate>
                    <tr>
                        <td><%# Eval(“Deposit")  %></td>
                        <td><%# Eval(“Withdrawal")  %></td>
                        <td><%# Eval(“Reference")  %></td>
                        <td><%# Eval(“Date")  %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>  
            </asp:Repeater>
    </fieldset>   
    </div>
</asp:Content>
