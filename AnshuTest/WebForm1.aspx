<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="AnshuTest.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title> 
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <script type="text/javascript" src="js/JScript.js" ></script>

    <meta name="viewport" content="width=device-width" />
    
    <style type="text/css">
        body { font-family: Arial; font-size: 10pt; }
        .error { color: red; }
        .auto-style1 {
            width: 14px;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            height: 50px;
        }
        .auto-style4 {
            height: 50px;
            width: 297px;
        }
    </style>

</head>

    <body>

         <%-- <script type="text/javascript">
            function FindAge() {
                var day = document.getElementById("caldob").value;
                var DOB = new Date(day);
                var today = new Date();
                var txtAge = today.getTime() - DOB.getTime();
                txtAge = Math.floor(txtAge / (1000 * 60 * 60 * 24 * 365.25));
                document.getElementById("txtAge").value = Age;
            }
        </script>--%>

        <script type="text/javascript">
            $(function () {
            
                var count = 1;
                $("#caldob").datepicker(
                    {
                        changeMonth: true,
                        changeYear: true,
                        maxDate: 0,
                        dateFormat: 'yy-mm-dd',

                        onSelect: function (date) {
                            var dob = new Date(date);
                            var today = new Date();

                            if (dob.getFullYear() + 18 < today.getFullYear()) {

                                var ageInMilliseconds = new Date(today - dob);
                                var years = ageInMilliseconds / (24 * 60 * 60 * 1000 * 365.25);
                                var months = 12 * (years % 1);
                                var days = Math.floor(30 * (months % 1));
                                $('#txtAge').val(Math.floor(years))
                               // $('#txtAge').val(Math.floor(years) + ' years ' + Math.floor(months) + ' months ' + days + ' days');
                            }
                            else {
                                alert(" Under 18");
                                $('#caldob').val('')
                            }
                        }
                    });
            });
    //function ValidateDOB(sender, args) {
    //    //Get the date from the TextBox.
    //    var dateString = document.getElementById(sender.controltovalidate).value;
    //    var regex = /(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$/;
 
    //    //Check whether valid dd/MM/yyyy Date Format.
    //    if (regex.test(dateString)) {
    //        var parts = dateString.split("/");
    //        var dtDOB = new Date(parts[1] + "/" + parts[0] + "/" + parts[2]);
    //        var dtCurrent = new Date();
    //        sender.innerHTML = "Eligibility 18 years ONLY."
    //        if (dtCurrent.getFullYear() - dtDOB.getFullYear() < 18) {
    //            args.IsValid = false;
    //            return;
    //        }
 
    //        if (dtCurrent.getFullYear() - dtDOB.getFullYear() == 18) {
 
    //            //CD: 11/06/2018 and DB: 15/07/2000. Will turned 18 on 15/07/2018.
    //            if (dtCurrent.getMonth() < dtDOB.getMonth()) {
    //                args.IsValid = false;
    //                return;
    //            }
    //            if (dtCurrent.getMonth() == dtDOB.getMonth()) {
    //                //CD: 11/06/2018 and DB: 15/06/2000. Will turned 18 on 15/06/2018.
    //                if (dtCurrent.getDate() < dtDOB.getDate()) {
    //                    args.IsValid = false;
    //                    return;
    //                }
    //            }
    //        }
    //        args.IsValid = true;
    //    } else {
    //        sender.innerHTML = "Enter date in dd/MM/yyyy format ONLY."
    //        args.IsValid = false;
    //    }
    //}
        </script>


    <form id="form1" runat="server"> 
        <h1>Employee Registration Form</h1>
        <div>
            <div>Employee photo upload:</div>
            <span id="lblMessage" style="color: red;"></span>
<br/>
          <div><asp:FileUpload ID="fileUpload" runat="server" ForeColor="Green" />
              <br />
              
            </div>
   <%--<div><asp:Image ID="imgPreview" runat="server"  /></div>--%>
 <%--<div><asp:Button ID="btnUpload" runat="server" Text="Upload"  /></div>--%>

<%-- <script type="text/javascript" src=""></script>
  <script type="text/javascript">
    $(function () {
        $("#fileUpload").bind("click", function () {
            $("#lblMessage").html("");
            var file = $("#fuUpload");
            var size = parseFloat(file[0].files[0].size);
            var maxSizeKB = 20; //Size in KB.
            var maxSize = maxSizeKB * 1024; //File size is returned in Bytes.
            if (size > maxSize) {
                $("#lblMessage").html("Maximum file size " + maxSizeKB + "KB allowed.");
                file.val("");
                return false;
            }
        });
    });
</script>--%>

           </div>

        <div>
            <div>Employee code:</div>
       <div> <asp:TextBox ID="empcode" runat="server"></asp:TextBox></div>
        </div>
            <div>           
                <div>FirstName<span style="color: Red">*</span></div>
                <div> <asp:TextBox ID="textname" runat="server"></asp:TextBox> 
                  <%--  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="textname"
                         ErrorMessage="Enter Only Character !" ForeColor="Red"
                         ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>--%>
                </div>

               <%-- <asp:RegularExpressionValidator ID="txtAlpha" runat="server" ControlToValidate="textname" 
                    ForeColor="Red" ValidationExpression="[a-za-z]" ErrorMessage="*Valid character:Only Alphabets."></asp:RegularExpressionValidator>--%>
                 </div>

        <div>
            <div>MiddleName</div>
                <div> <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
           <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox1"
                         ErrorMessage="Enter Only Character !" ForeColor="Red"
                         ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>--%>
                 </div>
             </div>

        <div>
        <div>LastName<span style="color: Red">*</span></div>
                <div> <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> 
                   <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox2"
                         ErrorMessage="Enter Only Character !" ForeColor="Red"
                         ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>--%>
                </div>
                 </div>
     
      

            <div>
                <div>DOB<span style="color: Red">*</span></div>
                <div><asp:TextBox ID="caldob" runat="server" ></asp:TextBox></div>
                
                 <div>

               </div>
            </div>

            <div>
                <div>Age</div>
                <div>
                    <asp:TextBox ID="txtAge" runat="server" onmousmove="FindAge()"></asp:TextBox>
                </div>
            </div>
            <div>
                <div>Gender</div>
                <div>
                    <asp:DropDownList ID="ddgender" runat="server">
                        <asp:ListItem Value="">--Select--</asp:ListItem>
                        <asp:ListItem Value="Male">Male </asp:ListItem>
                        <asp:ListItem Value="Female">Female</asp:ListItem>
                        <asp:ListItem Value="Other">Other</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div>
                <div>Contact No<span style="color: Red">*</span></div>
               
               <div><asp:TextBox ID="txtcontact" runat="server" MaxLength="10"></asp:TextBox> 
                  <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtcontact" ForeColor="Red"
                        ErrorMessage="Enter correct Contact No. !" ValidationExpression="^([7-9]{1})([0-9]{9})$"></asp:RegularExpressionValidator>--%>
                </div>
           
            <div>
                <asp:HiddenField  ID="hfmaxid" runat="server"/>
     
 </div>
       
         </div>
            
                <div>
                <div>Email ID</div>
               
                  <div>
                      <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>  


   <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtemail" ForeColor="Red"
    ErrorMessage="Invalid Email Id !" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>--%>


                 </div>

              </div>
            
           
        <div>
                <div>Qualification :</div>
        </div>
   <%--</div><asp:TextBox ID="txtDegree" runat="server" placeholder="Degree" ></asp:TextBox> 
   <asp:TextBox ID="txtPassingYear" runat="server" placeholder="Passing Year"></asp:TextBox>
  <asp:TextBox ID="txtPercentage" runat="server" placeholder="Percentage"></asp:TextBox>
  <asp:Button ID="btnAddEducation" runat="server" Text="Add Education" OnClick="btnAddEducation_Click"  />--%>
  <asp:GridView ID="gvEducation" runat="server" CssClass="Grid" AutoGenerateColumns="False" EmptyDataText="No records has been added." CellPadding="4" ForeColor="#333333" GridLines="None" >
      <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:TemplateField HeaderText="Sr No" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <%#Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Degree" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="Degree" runat="server" Text='<%#Eval("Degree") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
        <asp:TemplateField HeaderText="passingyear" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="passingyear" runat="server" Text='<%#Eval("passingyear") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
        <asp:TemplateField HeaderText="percentage" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
        <asp:Label ID="percentage" runat="server" Text='<%#Eval("percentage") %>'></asp:Label>
                                                </ItemTemplate>

                </asp:TemplateField>
              <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
            <asp:LinkButton ID="btnedit" runat="server" Text="Edit" CommandName="b" CommandArgument=' <%#Eval("Degree") %>' ></asp:LinkButton>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
         <asp:LinkButton ID="btdelete" runat="server" Text="Delete" CommandName="a" CommandArgument=' <%#Eval("Degree") %>' ></asp:LinkButton>
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
     <br />
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <tr>
    <td style="padding-bottom: 10px" class="auto-style1">
        Degree:<br />
        <asp:TextBox ID="txtDegree" runat="server" />
    </td>
  </tr>
  <tr>
    <td style="padding-bottom: 10px" class="auto-style1">
        PassingYear:<br />
        <asp:TextBox ID="txtPassingYear" runat="server" />
    </td>
  </tr>
         <tr>
    <td style="padding-bottom: 10px" class="auto-style1">
        Percentage:<br />
        <asp:TextBox ID="txtPercentage" runat="server" />
    </td>
  </tr>
  <tr>
    <td class="auto-style1">
        <asp:Button ID="btnAddEducation" runat="server" Text="Add" OnClick="Insert" Width="81px" Height="29px" style="margin-left: 24px" />
        <br />
        <asp:Button ID="btnsave" OnClientClick="GetData()" runat="server" Text="save" OnClick="btnsave_Click" style="margin-left: 12px" Width="117px" />
    </td>
   </tr>
  </table>
    
          

   <%-- <Columns>
        <asp:BoundField DataField="ID" HeaderText="ID" />
        <asp:BoundField DataField="Degree" HeaderText="Degree" />
        <asp:BoundField DataField="PassingYear" HeaderText="Passing Year" />
        <asp:BoundField DataField="Percentage" HeaderText="Percentage" />
        <asp:TemplateField HeaderText="Actions">
          <ItemTemplate>
                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" />
                <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete" />
            </ItemTemplate>
            <asp:GridView runat="server"></asp:GridView>
        </asp:TemplateField>
    </Columns>--%>

        </div>
        
            <div>

    <div> </div>     
                </div>
            
  <div>
    <asp:GridView ID="griemploye" runat="server" OnRowCommand="griemploye_RowCommand" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="griemploye_SelectedIndexChanged">
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

                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
            <asp:LinkButton ID="btnedit" runat="server" Text="Edit" CommandName="b" CommandArgument=' <%#Eval("id") %>' ></asp:LinkButton>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
         <asp:LinkButton ID="btdelete" runat="server" Text="Delete" CommandName="a" CommandArgument=' <%#Eval("id") %>' ></asp:LinkButton>


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
                </div>
            
        
    </form>
</body>
</html>
