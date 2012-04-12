using System;
using System.Data;
using System.Configuration;
using System.Web;
using DataAcess.Entitys;

namespace BussinessRules
{
    public class FAQsBO
    {
        private static FAQs FaQ = new FAQs();
        public static DataTable GetByAll()
        {
            DataTable tbFaQ = FaQ.GetByAll();

            return tbFaQ;
        }
        public static DataTable GetByWhere(FAQs f)
        {
            DataTable tbFaQ = FaQ.GetByWhere(f);

            return tbFaQ;
        }
        public static int Update(FAQs f)
        {
            int i = 0;
            FaQ.FaqID = f.FaqID;
            FaQ.Question = f.Question;
            FaQ.Answers = f.Answers;
            FaQ.Status = f.Status;

            return i = FaQ.Update(f);
        }
        public static int Delete(FAQs f)
        {
            int i = 0;

            i = FaQ.Delete(f);
            return i;
        }
    }
}
