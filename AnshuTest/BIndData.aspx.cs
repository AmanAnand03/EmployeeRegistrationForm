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

public partial class BIndData : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=AMAN\\GEMINISQL;Initial Catalog=Employee91 ;User ID=sa;Password=sa@123;");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
           
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
     
    protected void gobten_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select Age+'/'+Gender Agegender,* from employee12 where  cast(Createddate as date) between cast('"+date.Text+"' as date) and cast('"+TextBox1.Text+"' as date)", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        griemploye.DataSource = dt;
        griemploye.DataBind();
    }
}