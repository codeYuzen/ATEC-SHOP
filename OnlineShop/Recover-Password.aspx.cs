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
using System.Net;
using System.Net.Mail;

namespace OnlineShop
{
    public partial class Recover_Password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void forgotPW_Click(object sender, EventArgs e)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineShopConnectionString"].ConnectionString);
            SqlCommand sqlCommand = new SqlCommand();

            sqlCommand.Parameters.AddWithValue("@email", email.Text);

            SqlParameter value = new SqlParameter();
            value.ParameterName = "@return";
            value.Direction = ParameterDirection.Output;
            value.SqlDbType = SqlDbType.Int;
            sqlCommand.Parameters.Add(value);

            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "emailToChangePW";

            sqlCommand.Connection = myConn;
            myConn.Open();
            sqlCommand.ExecuteNonQuery();

            int output = Convert.ToInt32(sqlCommand.Parameters["@return"].Value);

            if(output == 1)
            {
                String User = ConfigurationManager.AppSettings["SMTP_USER"];
                String Pass = ConfigurationManager.AppSettings["SMTP_PASS"];

                MailMessage mail = new MailMessage();
                SmtpClient servidor = new SmtpClient();

                mail.From = new MailAddress(User);
                mail.To.Add(new MailAddress(email.Text));
                mail.Subject = "Forgot Password - ATEC SHOP";
                mail.IsBodyHtml = true;
                mail.Body = "To change your password click <a href='https://localhost:44331/NewPassword.aspx?email=" + EncryptString(email.Text) + "'>here</a><br><br>If this was not you please ignore the email";

                servidor.Host = ConfigurationManager.AppSettings["SMTP_HOST"];
                servidor.Port = int.Parse(ConfigurationManager.AppSettings["SMTP_PORT"]);

                servidor.Credentials = new NetworkCredential(User, Pass);
                servidor.EnableSsl = true;

                servidor.Send(mail);
                lbl_message.Text = "An email has been sent!";
                Session["newPasswordRequest"] = true;
            }
            else
            {
                lbl_message.Text = "That email does not exist!";
            }

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