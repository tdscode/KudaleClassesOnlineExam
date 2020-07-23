using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class admin_editquestion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string qid = Request.QueryString["qid"];
        if (!IsPostBack)
        {
            if (qid == null)
            {
                Response.Redirect("~/admin/question.aspx");
            }
            else
            {
                if (FileUpload2.PostedFile != null && FileUpload2.PostedFile.ContentLength > 0)
                {
                    UpLoadAndDisplay1();

                }
                if (FileUpload3.PostedFile != null && FileUpload3.PostedFile.ContentLength > 0)
                {
                    UpLoadAndDisplay2();

                }
                if (FileUpload4.PostedFile != null && FileUpload4.PostedFile.ContentLength > 0)
                {
                    UpLoadAndDisplay3();

                }
                if (FileUpload5.PostedFile != null && FileUpload5.PostedFile.ContentLength > 0)
                {
                    UpLoadAndDisplay4();

                }
                if (FileUpload6.PostedFile != null && FileUpload6.PostedFile.ContentLength > 0)
                {
                    UpLoadAndDisplay5();

                }
            }
                get_editexamquestion(Convert.ToInt32(qid));
            get_editexamdrp();
            // get_editsubjectdrp();
        }
        else
        {
            if (FileUpload2.PostedFile != null && FileUpload2.PostedFile.ContentLength > 0)
            {
                UpLoadAndDisplay1();

            }
            if (FileUpload3.PostedFile != null && FileUpload3.PostedFile.ContentLength > 0)
            {
                UpLoadAndDisplay2();

            }
            if (FileUpload4.PostedFile != null && FileUpload4.PostedFile.ContentLength > 0)
            {
                UpLoadAndDisplay3();

            }
            if (FileUpload5.PostedFile != null && FileUpload5.PostedFile.ContentLength > 0)
            {
                UpLoadAndDisplay4();

            }
            if (FileUpload6.PostedFile != null && FileUpload6.PostedFile.ContentLength > 0)
            {
                UpLoadAndDisplay5();

            }
        }
    }

    private void UpLoadAndDisplay1()
    {
        string imgName = FileUpload2.FileName;
        string imgPath = "/assets/image/" + "Question" + imgName;
        int imgSize = FileUpload2.PostedFile.ContentLength;
        if (FileUpload2.PostedFile != null && FileUpload2.PostedFile.FileName != "")
        {
            FileUpload2.SaveAs(Server.MapPath(imgPath));
            Image2.ImageUrl = ".." + imgPath;
        }
    }
    private void UpLoadAndDisplay2()
    {
        string imgName = FileUpload3.FileName;
        string imgPath = "/assets/image/" + "Question" + imgName;
        int imgSize = FileUpload3.PostedFile.ContentLength;
        if (FileUpload3.PostedFile != null && FileUpload3.PostedFile.FileName != "")
        {
            FileUpload3.SaveAs(Server.MapPath(imgPath));
            Image3.ImageUrl = ".." + imgPath;
        }
    }
    private void UpLoadAndDisplay3()
    {
        string imgName = FileUpload4.FileName;
        string imgPath = "/assets/image/" + "Question" + imgName;
        int imgSize = FileUpload4.PostedFile.ContentLength;
        if (FileUpload4.PostedFile != null && FileUpload4.PostedFile.FileName != "")
        {
            FileUpload4.SaveAs(Server.MapPath(imgPath));
            Image4.ImageUrl = ".." + imgPath;
        }
    }
    private void UpLoadAndDisplay4()
    {
        string imgName = FileUpload5.FileName;
        string imgPath = "/assets/image/" + "Question" + imgName;
        int imgSize = FileUpload5.PostedFile.ContentLength;
        if (FileUpload5.PostedFile != null && FileUpload5.PostedFile.FileName != "")
        {
            FileUpload5.SaveAs(Server.MapPath(imgPath));
            Image5.ImageUrl = ".." + imgPath;
        }
    }
    private void UpLoadAndDisplay5()
    {
        string imgName = FileUpload6.FileName;
        string imgPath = "/assets/image/" + "Question" + imgName;
        int imgSize = FileUpload6.PostedFile.ContentLength;
        if (FileUpload6.PostedFile != null && FileUpload6.PostedFile.FileName != "")
        {
            FileUpload6.SaveAs(Server.MapPath(imgPath));
            Image6.ImageUrl = ".." + imgPath;
        }
    }
    string s = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

    protected void btn_editquestion_Click(object sender, EventArgs e)
    {
        string qid = Request.QueryString["qid"];
        if (IsValid)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spEditquestion", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@questionid", Convert.ToInt32(qid));
                cmd.Parameters.AddWithValue("@questionname", Image2.ImageUrl);
                cmd.Parameters.AddWithValue("@optionone", Image3.ImageUrl);
                cmd.Parameters.AddWithValue("@optiontwo", Image4.ImageUrl);
                cmd.Parameters.AddWithValue("@optionthree", Image5.ImageUrl);
                cmd.Parameters.AddWithValue("@optionfour", Image6.ImageUrl);
                cmd.Parameters.AddWithValue("@questionanswer", rdo_editcorrectanswer.SelectedValue);
                cmd.Parameters.AddWithValue("@examfid", drp_editexam.SelectedValue);
                try
                {
                    con.Open();
                    int i = (int)cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Redirect("~/admin/question.aspx");
                    }
                    else
                    {
                        //txt_editquestionname.Focus();
                        panel_editquestion_warning.Visible = true;
                        lbl_editquestionwarning.Text = "Something went wrong. Can't update. Please try after sometime later</br> ";
                    }
                }
                catch (Exception ex)
                {
                    //txt_editquestionname.Focus();
                    panel_editquestion_warning.Visible = true;
                    lbl_editquestionwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            } // end of using 
        }
        else
        {
            //txt_editquestionname.Focus();
            panel_editquestion_warning.Visible = true;
            lbl_editquestionwarning.Text = "You must fill all the requirements";
        }
    }
    //method for editfill
    public void get_editexamquestion(int id)
    {

        using (SqlConnection con = new SqlConnection(s))
        {
            SqlCommand cmd = new SqlCommand("spEditquestionfill", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@questionid", id);
            try
            {
                con.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    Image2.ImageUrl = rd["question_name"].ToString();
                    Image3.ImageUrl = rd["option_one"].ToString();
                    Image4.ImageUrl = rd["option_two"].ToString();
                    Image5.ImageUrl = rd["option_three"].ToString();
                    Image6.ImageUrl = rd["option_four"].ToString();

                }
            }
            catch (Exception ex)
            {
                panel_editquestion_warning.Visible = true;
                lbl_editquestionwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
            }
        }
    }
    //method for category dropdown
    public void get_editexamdrp()
    {
        using (SqlConnection con = new SqlConnection(s))
        {
            SqlCommand cmd = new SqlCommand("select * from exam", con);
            try
            {
                con.Open();
                drp_editexam.DataSource = cmd.ExecuteReader();
                drp_editexam.DataBind();
                ListItem li = new ListItem("Select category", "-1");
                drp_editexam.Items.Insert(0, li);
            }
            catch (Exception ex)
            {
                //txt_editquestionname.Focus();
                panel_editquestion_warning.Visible = true;
                lbl_editquestionwarning.Text = "Something went wrong. Try again </br>" + ex.Message;
            }
        }
    }



}