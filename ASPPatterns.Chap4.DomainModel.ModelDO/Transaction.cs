using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPPatterns.Chap4.DomainModel.ModelDO
{
    public class Transaction
    {
        public Transaction(decimal deposit, decimal withdrawl, string reference, DateTime date)
        {
            this.Deposit = deposit;
            this.Withdrawal = withdrawl;
            this.Reference = reference;
            this.Date = date;
        }

        public decimal Deposit
        { get; internal set; }

        public decimal Withdrawal
        { get; internal set; }

        public string Reference
        { get; internal set; }

        public DateTime Date
        {getl internal set;}
    }
}
