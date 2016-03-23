<%@ Page Title="Contact Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" ValidateRequest="false"%> 
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>  
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
<h2>This page demonstrates the use of the Free Textbox. You can change content with the buttons below.</h2>
    <p>&nbsp;</p>
    <p>
        <asp:FormView ID="fvContact1" runat="server" DataKeyNames="Id" DataSourceID="sdsContact1">
            <EditItemTemplate>
                &nbsp;<FTB:FreeTextBox ID="ContactBodyFTB" runat="server" Text='<%# Bind("SectionContent") %>  ' ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage|Cut,Copy,Paste,Delete;Undo,Redo|SymbolsMenu|InsertRule,InsertDate,InsertTime"
height="600px" Width="100%" />

                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EmptyDataTemplate>
                <asp:LinkButton ID="lbAdd" runat="server" CommandName="New">Add New Content</asp:LinkButton>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                &nbsp;<FTB:FreeTextBox ID="ContactBodyFTB" runat="server" Text='<%# Bind("SectionContent") %>  ' ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage|Cut,Copy,Paste,Delete;Undo,Redo|SymbolsMenu|InsertRule,InsertDate,InsertTime"
height="600px" Width="100%" />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                &nbsp;<asp:Label ID="SectionContentLabel" runat="server" Text='<%# Bind("SectionContent") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
    </p>
    <p>
        <asp:SqlDataSource ID="sdsContact1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [FreeTextboxContact] WHERE [Id] = @Id" InsertCommand="INSERT INTO [FreeTextboxContact] ( [Page], [Section], [SectionContent]) VALUES (@Page, @Section, @SectionContent)" SelectCommand="SELECT * FROM [FreeTextboxContact] WHERE (([Page] = @Page) AND ([Section] = @Section))" UpdateCommand="UPDATE [FreeTextboxContact] SET [SectionContent] = @SectionContent WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Page" DefaultValue="Contact" />
                <asp:Parameter Name="Section" DefaultValue="BodyContact" />
                <asp:Parameter Name="SectionContent" DefaultValue="" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="Contact" Name="Page" />
                <asp:Parameter DefaultValue="BodyContact" Name="Section" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="SectionContent" />
                <asp:Parameter Name="Id" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
