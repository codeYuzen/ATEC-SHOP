using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;

namespace OnlineShop
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["logged"] != null) {
                if (Session["accountType"].Equals(0)) Response.Redirect("index.aspx");
                if (Session["accountType"].Equals(1)) Response.Redirect("users.aspx");
            }
        }

        protected void login_Click(object sender, EventArgs e)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineShopConnectionString"].ConnectionString);
            SqlCommand sqlCommand = new SqlCommand();

            sqlCommand.Parameters.AddWithValue("@email", email.Text);
            sqlCommand.Parameters.AddWithValue("@password", EncryptString(password.Text));

            SqlParameter value = new SqlParameter();
            value.ParameterName = "@return";
            value.Direction = ParameterDirection.Output;
            value.SqlDbType = SqlDbType.Int;
            sqlCommand.Parameters.Add(value);

            SqlParameter accType = new SqlParameter();
            accType.ParameterName = "@accType";
            accType.Direction = ParameterDirection.Output; 
            accType.SqlDbType = SqlDbType.Int;
            sqlCommand.Parameters.Add(accType);
            
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "login";

            sqlCommand.Connection = myConn;
            myConn.Open();
            sqlCommand.ExecuteNonQuery();

            int output = Convert.ToInt32(sqlCommand.Parameters["@return"].Value);
            int accTypeOutput = Convert.ToInt32(sqlCommand.Parameters["@accType"].Value);

            myConn.Close();

            if(output == 1)
            {
                Session["logged"] = true;
                Session["email"] = email.Text;
                Session["accountType"] = accTypeOutput;

                if (Session["accountType"].Equals(0)) Response.Redirect("index.aspx");
                if (Session["accountType"].Equals(1)) Response.Redirect("users.aspx");
            }
            else if(output == 2)
            {
                lbl_message.Text = "Account is not currently active";
            }
            else
            {
                lbl_message.Text = "Wrong email and/or password";
            }
        }

        protected void register_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
        public static string EncryptString(string Message)
        {
            string Passphrase = "atec";
            byte[] Results;
            System.Text.UTF8Encoding UTF8 = new System.Text.UTF8Encoding();

            // Step 1. We hash the passphrase using MD5
            // We use the MD5 hash generator as the result is a 128 bit byte array
            // which is a valid length for the TripleDES encoder we use below

            MD5CryptoServiceProvider HashProvider = new MD5CryptoServiceProvider();
            byte[] TDESKey = HashProvider.ComputeHash(UTF8.GetBytes(Passphrase));

            // Step 2. Create a new TripleDESCryptoServiceProvider object
            TripleDESCryptoServiceProvider TDESAlgorithm = new TripleDESCryptoServiceProvider();

            // Step 3. Setup the encoder
            TDESAlgorithm.Key = TDESKey;
            TDESAlgorithm.Mode = CipherMode.ECB;
            TDESAlgorithm.Padding = PaddingMode.PKCS7;

            // Step 4. Convert the input string to a byte[]
            byte[] DataToEncrypt = UTF8.GetBytes(Message);

            // Step 5. Attempt to encrypt the string
            try
            {
                ICryptoTransform Encryptor = TDESAlgorithm.CreateEncryptor();
                Results = Encryptor.TransformFinalBlock(DataToEncrypt, 0, DataToEncrypt.Length);
            }
            finally
            {
                // Clear the TripleDes and Hashprovider services of any sensitive information
                TDESAlgorithm.Clear();
                HashProvider.Clear();
            }

            // Step 6. Return the encrypted string as a base64 encoded string

            string enc = Convert.ToBase64String(Results);
            enc = enc.Replace("+", "KKK");
            enc = enc.Replace("/", "JJJ");
            enc = enc.Replace("\\", "III");
            return enc;
        }

        protected void forgot_pw_Click(object sender, EventArgs e)
        {
            Response.Redirect("Recover-Password.aspx");
        }
    }
}