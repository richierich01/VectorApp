using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace VectorWebForms
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var vectorDBConnectionString = ConfigurationManager.ConnectionStrings["VectorDBConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(vectorDBConnectionString))
            {
                SqlDataAdapter sde = new SqlDataAdapter("Select * from students", con);
                DataSet ds = new DataSet();
                sde.Fill(ds);
                GvData.DataSource = ds;
                GvData.DataBind();
            }

        }
    }
}