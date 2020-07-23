using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class admin_addquestion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string eid = Request.QueryString["eid"];
            if (eid == null)
            {
                Response.Redirect("~/admin/exam.aspx");
            }
            else
            {
                if (FileUpload1.PostedFile != null && FileUpload1.PostedFile.ContentLength > 0)
                {
                    UpLoadAndDisplay();

                }
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
        else
        {
            if (FileUpload1.PostedFile != null && FileUpload1.PostedFile.ContentLength > 0)
            {
                UpLoadAndDisplay();

            }
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

    private void UpLoadAndDisplay()
    {
        string imgName = FileUpload1.FileName;
        string imgPath = "/assets/image/" + "Question" + imgName;
        int imgSize = FileUpload1.PostedFile.ContentLength;
        if (FileUpload1.PostedFile != null && FileUpload1.PostedFile.FileName != "")
        {
            FileUpload1.SaveAs(Server.MapPath(imgPath));
            Image1.ImageUrl = ".." + imgPath;
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


    string s = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString; //string of connection
    //for adding the question having exam id
    protected void btn_addquestion_Click(object sender, EventArgs e)
    {
        string eid = Request.QueryString["eid"];
        if (IsValid)
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("spAddquestion", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@questionname", Image2.ImageUrl);
                cmd.Parameters.AddWithValue("@optionone", Image3.ImageUrl);
                cmd.Parameters.AddWithValue("@optiontwo", Image4.ImageUrl);
                cmd.Parameters.AddWithValue("@optionthree", Image5.ImageUrl);
                cmd.Parameters.AddWithValue("@optionfour", Image6.ImageUrl);
                cmd.Parameters.AddWithValue("@questionanswer", rdo_correctanswer.SelectedValue);
                cmd.Parameters.AddWithValue("@examfid", Convert.ToInt32(eid));
                try
                {
                    con.Open();
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Redirect("~/admin/exam.aspx");
                    }
                    else
                    {
                        //txt_questionname.Focus();
                        panel_addquestion_warning.Visible = true;
                        lbl_addquestionwarning.Text = "Try again. Subject is not added";
                    }
                }
                catch (Exception ex)
                {
                    //txt_questionname.Focus();
                    panel_addquestion_warning.Visible = true;
                    lbl_addquestionwarning.Text = "Something went wrong. Subject is not added </br>" + ex.Message;
                }
            } //end of using
        }
        else
        {
            //txt_questionname.Focus();
            panel_addquestion_warning.Visible = true;
            lbl_addquestionwarning.Text = "You must fill all the requirements";
        }
    }

}