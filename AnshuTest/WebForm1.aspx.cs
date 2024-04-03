using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;

namespace AnshuTest
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=AMAN\\GEMINISQL;Initial Catalog=Employee91 ;User ID=sa;Password=sa@123;");
        private object txtValue;

        public object LblOutput { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!this.IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Degree"), new DataColumn("PassingYear"), new DataColumn("Percentage") });
                ViewState["Qualification"] = dt;
                this.BindGrid();

            }

            if (!IsPostBack)
            {
                show();
            }


        }


        protected void BindGrid()
        {
            gvEducation.DataSource = (DataTable)ViewState["Qualification"];
            gvEducation.DataBind();
        }



        protected void Insert(object sender, EventArgs e)
        {

            DataTable dt = (DataTable)ViewState["Qualification"];
            dt.Rows.Add(txtDegree.Text.Trim(), txtPassingYear.Text.Trim(), txtPercentage.Text.Trim());
            ViewState["Qualification"] = dt;
            this.BindGrid();
            txtDegree.Text = "";
            txtPassingYear.Text = "";
            txtPercentage.Text = "";


        }


        protected void clear()
        {
            empcode.Text = "";
            textname.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            caldob.Text = "";
            txtAge.Text = "";
            ddgender.SelectedValue = "";
            txtcontact.Text = "";
            txtemail.Text = "";
            txtDegree.Text = "";
            txtPassingYear.Text = "";
            txtPercentage.Text = "";

        }




        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (Validation())
            {
                if (btnsave.Text == "Update")
                {
                    string EditID = ViewState["EditID"].ToString();

                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update employee12 set FirstName='" + textname.Text + "',MiddleName='" + TextBox1.Text + "' ,LastName='" + TextBox2.Text + "' ,Gender='" + ddgender.SelectedValue + "' ,DOB='" + caldob.Text + "' ,Age='" + txtAge.Text + "' ,Contactno='" + txtcontact.Text + "' ,Emailid='" + txtemail.Text + "' ,Uimg='" + fileUpload + "',Modifydate=getdate(),isactive='1' where id='" + EditID + "'", con);
                    cmd.ExecuteNonQuery();
                    //{
                    //    SqlCommand cmdeducation12 = new SqlCommand("Update education12 where employee12 set Degree='" + txtDegree.Text + "',PassingYear='" + txtPassingYear.Text + "' ,Percentage='" + txtPercentage.Text + "' where id='" + EditID + "'", con);
                    //    cmdeducation12.ExecuteNonQuery();
                    //}    
                    con.Close();
                    show();
                    clear();
                    ScriptManager.RegisterStartupScript(this, GetType(), "EmpSave", "alert('Update Successfully !');", true);
                }
                else
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("insert into employee12 ([FirstName] ,[MiddleName] ,[LastName] ,[Gender] ,[DOB] ,[Age] ,[Contactno] ,[Emailid] ,[isactive] ,[Createddate]) values ('" + textname.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + ddgender.SelectedValue + "','" + caldob.Text + "','" + txtAge.Text + "','" + txtcontact.Text + "','" + txtemail.Text + "' ,1,GETDATE())", con);
                    cmd.ExecuteNonQuery();
                    foreach (GridViewRow mRow in gvEducation.Rows)
                    {
                        SqlCommand cmdmaxid = new SqlCommand("select MAx(ID)ID from employee12", con);

                        SqlDataAdapter damaxid = new SqlDataAdapter(cmdmaxid);
                        DataTable dtmax = new DataTable();
                        damaxid.Fill(dtmax);

                        hfmaxid.Value = dtmax.Rows[0]["ID"].ToString();

                        Label Degree = (Label)mRow.FindControl("Degree");
                        Label PassingYear = (Label)mRow.FindControl("PassingYear");
                        Label Percentage = (Label)mRow.FindControl("Percentage");

                        SqlCommand cmdeducation12 = new SqlCommand("insert into education12 (Degree,passingyear,percentage,Empid,isactive,Createddate) values ('" + Degree.Text + "','" + PassingYear.Text + "','" + Percentage.Text + "','" + hfmaxid.Value + "',1,GETDATE())", con);
                        cmdeducation12.ExecuteNonQuery();
                    }
                    con.Close();
                    show();
                    clear();
                    ScriptManager.RegisterStartupScript(this, GetType(), "EmpSave", "alert('Data Save Successfully !');", true);

                }
            }
            {
                string Employee_img = Server.MapPath("~/Employee_img/");

                //Check whether Directory (Folder) exists.
                if (!Directory.Exists(Employee_img))
                {
                    //If Directory (Folder) does not exists. Create it.
                    Directory.CreateDirectory(Employee_img);
                }

                //Save the File to the Directory (Folder).
                //fileUpload.SaveAs(Employee_img + Path.GetFileName(fileUpload.FileName));

                ////Display the success message.
                //lblMessage.Text = Path.GetFileName(fileUpload.FileName) + " has been uploaded.";
            }





        }


        public void show()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select Age+'/'+Gender Agegender,* from employee12 ", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            griemploye.DataSource = dt;
            griemploye.DataBind();

        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView2_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }


        protected void griemploye_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "a")
            {

                con.Open();

                SqlCommand cmd2 = new SqlCommand("delete  from employee12 where id='" + e.CommandArgument + "'", con);
                cmd2.ExecuteNonQuery();

                // SqlCommand cmdeducation12 = new SqlCommand("delete from education12 where empid = '" + e.CommandArgument + "'", con);
                //  cmdeducation12.ExecuteNonQuery();
                con.Close();
                show();
                clear();
                ScriptManager.RegisterStartupScript(this, GetType(), "EmpSave", "alert('Delete Successfully !');", true);




            }
            if (e.CommandName == "b")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from employee12 where id='" + e.CommandArgument + "'", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                textname.Text = dt.Rows[0]["FirstName"].ToString();
                TextBox1.Text = dt.Rows[0]["MiddleName"].ToString();
                TextBox2.Text = dt.Rows[0]["LastName"].ToString();
                caldob.Text = dt.Rows[0]["DOB"].ToString();
                txtAge.Text = dt.Rows[0]["Age"].ToString();
                ddgender.SelectedValue = dt.Rows[0]["Gender"].ToString();
                txtcontact.Text = dt.Rows[0]["Contactno"].ToString();
                txtemail.Text = dt.Rows[0]["Emailid"].ToString();
                //fileUpload = dt.Rows[0]["Uimg"].To();
                ViewState["ItemData"] = dt;
                ViewState["EditID"] = e.CommandArgument;
                btnsave.Text = "Update";

                //education gridview bind
                SqlCommand cmdedu = new SqlCommand("select * from education12 where empid = '" + e.CommandArgument + "'", con);
                SqlDataAdapter daedu = new SqlDataAdapter(cmdedu);
                DataTable dtedu = new DataTable();
                daedu.Fill(dtedu);
                gvEducation.DataSource = dtedu;
                gvEducation.DataBind();
                con.Close();
                //clear();

                //foreach (GridViewRow mRow in gvEducation.Rows)
                //{
                //    SqlCommand cmdeducation12 = new SqlCommand("select * from education12 where id='" + e.CommandArgument + "'", con);
                //    //SqlDataAdapter da = new SqlDataAdapter(cmd);
                //    //DataTable dt = new DataTable();
                //    da.Fill(dt);
                //    con.Close();
                //    txtDegree.Text = dt.Rows[0]["Degree"].ToString();
                //    txtPassingYear.Text = dt.Rows[0]["passingyear"].ToString();
                //    txtPercentage.Text = dt.Rows[0]["Percentage"].ToString();
                //    ViewState["ItemData"] = dt;
                //    ViewState["EditDegree"] = e.CommandArgument;
                //}

            }
        }

        protected void btnAddEducation_Click(object sender, EventArgs e)
        {
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into education12 ([Degree] ,[PassingYear] ,[Percentage]) values ('" + txtDegree.Text + "','" + txtPassingYear.Text + "','" + txtPercentage.Text + "' )", con);
                cmd.ExecuteNonQuery();
                con.Close();
                show();
                ScriptManager.RegisterStartupScript(this, GetType(), "EduSave", "alert('Data Save Successfully !');", true);

            }
        }
        protected bool Validation()
        {
            if (textname.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "EduSave", "alert('Enter First Name !');", true);
                return false;
            }

            if (TextBox2.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "EduSave", "alert('Enter Last Name !');", true);
                return false;
            }

            if (caldob.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "EduSave", "alert('Enter DOB !');", true);
                return false;
            }

            if (txtcontact.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "EduSave", "alert('Enter Contact No !');", true);
                return false;
            }


            return true;
        }




        protected void txtEmployeeCode_TextChanged(object sender, EventArgs e)
        {

        }



        protected void gvEducation_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void griemploye_SelectedIndexChanged(object sender, EventArgs e)
        {
            //con.Open();
            //SqlCommand cmd = new SqlCommand("select * from education12 , where id = '" + gvEducation + "'", con);
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            //con.Close();

            //gvEducation.DataSource = (DataTable)ViewState["Qualification"];
            //gvEducation.DataBind();
        }
    }
}