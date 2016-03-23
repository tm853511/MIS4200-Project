<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Account_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
    <br />
</p>
<p>
    <asp:GridView ID="gvProfile" runat="server" AutoGenerateColumns="False" DataKeyNames="Email" DataSourceID="sdsProfile">
        <Columns>
            <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position" />
            <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
        </Columns>
        <EmptyDataTemplate>
            No data
        </EmptyDataTemplate>
    </asp:GridView>
</p>
<p>
    <asp:SqlDataSource ID="sdsProfile" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Users] WHERE [Email] = @Email" InsertCommand="INSERT INTO [Users] ([Email], [FirstName], [LastName], [Address], [Phone], [Position], [Duration]) VALUES (@Email, @FirstName, @LastName, @Address, @Phone, @Position, @Duration)" SelectCommand="SELECT [Email], [FirstName], [LastName], [Address], [Phone], [Position], [Duration] FROM [Users] WHERE ([Email] = @Email)" UpdateCommand="UPDATE [Users] SET [FirstName] = @FirstName, [LastName] = @LastName, [Address] = @Address, [Phone] = @Phone, [Position] = @Position, [Duration] = @Duration WHERE [Email] = @Email">
        <DeleteParameters>
            <asp:Parameter Name="Email" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Position" Type="String" />
            <asp:Parameter Name="Duration" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtProfile" Name="Email" PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Position" Type="String" />
            <asp:Parameter Name="Duration" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:TextBox ID="txtProfile" runat="server" Visible="False"></asp:TextBox>
</p>
</asp:Content>

