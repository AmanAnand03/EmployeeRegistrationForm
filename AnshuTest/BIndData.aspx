<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BIndData.aspx.cs" Inherits="BIndData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <h1>Employee Search Records:</h1>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <table>
        <tr>
            <td>From Date</td>
            <td>
                <asp:TextBox ID="date" runat="server" Textmode="Date"></asp:TextBox>
            </td>
          <td>TO Date</td>
               <td>
                <asp:TextBox ID="TextBox1" runat="server" TextMode="date" ></asp:TextBox>
            </td>
        </tr>
       
        <tr>
            <td>
                <asp:Button ID="gobten" runat="server" Text="Go Buttton" OnClick="gobten_Click" />
            </td>
        </tr>
    </table>




      <table>
          <tr>
              <td>


                   <asp:GridView ID="griemploye" runat="server"  AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Sr No">
                                <ItemTemplate>
                                    <%#Eval("id" )%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="FirstName">
                                <ItemTemplate>
                                    <%#Eval("FirstName") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Middle Name">
                                <ItemTemplate>
                                    <%#Eval("MiddleName")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Name">
                                <ItemTemplate>
                                    <%#Eval("LastName")%>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Age/Gender">
                                <ItemTemplate>
                                    <%#Eval("Agegender")%>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DOB">
                                <ItemTemplate>
                                    <%#Eval("DOB")%>
                                </ItemTemplate>
                            </asp:TemplateField>

                              <asp:TemplateField HeaderText="Contactno">
                                <ItemTemplate>
                                    <%#Eval("Contactno")%>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>

                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />

                    </asp:GridView>
              </td>
          </tr>
      </table>
    </div>
    </form>
</body>
</html>
