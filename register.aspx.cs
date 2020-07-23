using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            get_categorydrp();
        }
    }

    public void get_categorydrp()
    {
        string s = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        using (SqlConnection con = new SqlConnection(s))
        {
            SqlCommand cmd = new SqlCommand("select * from category", con);
            try
            {
                con.Open();
                drp_categoryexam.DataSource = cmd.ExecuteReader();
                drp_categoryexam.DataBind();
                ListItem li = new ListItem("Select category", "-1");
                drp_categoryexam.Items.Insert(0, li);
            }
            catch (Exception ex)
            {
            }
        }
    }

    public void OnSelectedIndexChanged_stdChange(object sender, EventArgs e)
    {
        get_subjectdrp(Convert.ToInt32(drp_categoryexam.SelectedValue));
    }

    public void get_subjectdrp(int a)
    {
        string s = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(s))
        {
            SqlCommand cmd = new SqlCommand("select subject_id, subject_name from subject where category_fid=" + a, con);
            try
            {
                con.Open();
                //drp_subjectexam.DataSource = cmd.ExecuteReader();
                //drp_subjectexam.DataBind();
                //ListItem li = new ListItem("Select subject", "-1");
                //drp_subjectexam.Items.Insert(0, li);

                chkSubjects.DataSource = cmd.ExecuteReader();//Set Datasource to CheckBox List  
                chkSubjects.DataBind(); // Bind the checkboxList with String List.  

            }
            catch (Exception ex)
            {
               
            }
        }
    }
    protected void btn_register_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string s = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            string chkSub = "";

            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("spUsersRegisterinsert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@user_fname", txt_fname.Text);
                cmd.Parameters.AddWithValue("@user_lname", txt_lname.Text);
                cmd.Parameters.AddWithValue("@email", txt_email.Text);
                cmd.Parameters.AddWithValue("@password", txt_pass.Text);
                cmd.Parameters.AddWithValue("@mobile_no", Convert.ToInt64( txtMobileNo.Text));
                cmd.Parameters.AddWithValue("@stud_std", Convert.ToInt64(drp_categoryexam.SelectedItem.Value));


                for (int i = 0; i < chkSubjects.Items.Count; i++)
                {
                    if (chkSubjects.Items[i].Selected == true)// getting selected value from CheckBox List  
                    {
                        //chkSub += chkSubjects.Items[i].Text + " ," + "<br/>"; // add selected Item text to the String .
                        chkSub += chkSubjects.Items[i].Value ; // add selected Item text to the String .

                        if ((i + 1) != chkSubjects.Items.Count)
                        {
                            chkSub += ",";
                        }

                    }

                }
                cmd.Parameters.AddWithValue("@sub_id", chkSub);
                try
                {
                    con.Open();
                    int value = (int)cmd.ExecuteScalar(); // as procedure return number
                    if (value == 1)
                    {
                        Response.Redirect("~/Login.aspx?register=successfull");
                    }
                    else
                    {
                        pnl_warning.Visible = true;
                        lbl_warning.Text = "Email is already in use";
                    }

                }
                catch (Exception ex)
                {
                    pnl_warning.Visible = true;
                    lbl_warning.Text = "Something went wrong! Contact your devloper </br>" +ex.Message;
                }
            }
        }
        else
        {
            pnl_warning.Visible = true;
            lbl_warning.Text = "Please fill all the requirements";
        }

    }
}