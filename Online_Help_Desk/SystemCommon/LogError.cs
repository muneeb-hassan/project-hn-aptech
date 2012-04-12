using System;
using System.Data;
using System.Configuration;
using System.Web; 
using System.Text;
using System.IO;

namespace SystemCommon
{
    public class LogError
    {
        public static void LogMessage(string MethodName,string Content)
        {
            string currentDate = DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString();
            string filePath = AppDomain.CurrentDomain.BaseDirectory + "Bin\\" + currentDate + "LogError.txt";
            string strLog = string.Empty;
            strLog += "============  " + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString() + " " + MethodName + " "+ Content + "============\n";
            Encoding Strchar = Encoding.GetEncoding(65001); // UTF-8
            try
            {
                if (!File.Exists(filePath))
                {
                    FileStream file = File.Create(filePath);
                    StreamWriter writer = new StreamWriter(file, Strchar);
                    writer.WriteLine(strLog);

                    writer.Close();
                    file.Close();
                }
                else
                {
                    // Append text in file when file exitsed
                    FileStream oFile1 = new FileStream(filePath, FileMode.Open, FileAccess.Read, FileShare.Read);
                    if (oFile1.Length > 1048576)
                    {
                        oFile1.Close();
                        File.Delete(filePath);
                    }
                    else
                    {
                        oFile1.Close();
                    }
                    StreamWriter oReader = new StreamWriter(filePath, true, Strchar);
                    oReader.WriteLine(strLog);
                    oReader.Close();
                }
            }catch(Exception ex)
            {
            }
        }
    }
}
