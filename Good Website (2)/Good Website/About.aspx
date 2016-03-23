<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" ValidateRequest ="false" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>  
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Profile Page</h2>
    <h2>This page demonstrates the use of the Free Textbox. You can change content with the buttons below.</h2>
    <h2><asp:FormView ID="fvAbout1" runat="server" DataKeyNames="Id" DataSourceID="sdsAbout1">
        <EditItemTemplate>
            &nbsp;<FTB:FreeTextBox ID="AboutBodyFTB" runat="server" Text='<%# Bind("SectionContent") %>  ' ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage|Cut,Copy,Paste,Delete;Undo,Redo|SymbolsMenu|InsertRule,InsertDate,InsertTime"
height="600px" Width="100%" />

            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EmptyDataTemplate>
            <asp:LinkButton ID="lbAdd" runat="server" CommandName="New">Add New Content</asp:LinkButton>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            &nbsp;<FTB:FreeTextBox ID="AboutBodyFTB" runat="server" Text='<%# Bind("SectionContent") %>  ' ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage|Cut,Copy,Paste,Delete;Undo,Redo|SymbolsMenu|InsertRule,InsertDate,InsertTime"
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

        <asp:SqlDataSource ID="sdsAbout1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [FreeTextbox] WHERE [Id] = @Id" InsertCommand="INSERT INTO [FreeTextbox] ( [Page], [Section], [SectionContent]) VALUES (@Page, @Section, @SectionContent)" SelectCommand="SELECT * FROM [FreeTextbox] WHERE (([Page] = @Page) AND ([Section] = @Section))" UpdateCommand="UPDATE [FreeTextbox] SET [SectionContent] = @SectionContent WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DefaultValue="About" Name="Page" Type="String" />
                <asp:Parameter DefaultValue="Body" Name="Section" Type="String" />
                <asp:Parameter Name="SectionContent" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="About" Name="Page" Type="String" />
                <asp:Parameter DefaultValue="Body" Name="Section" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="SectionContent" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </h2>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>Please see the Contact page for another example of Free Textbox functionality.</p>
    <h3>&nbsp;</h3>
</asp:Content>
