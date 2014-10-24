using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPPatterns.Chap4.DomainModel.AppService.Messages;
using ASPPatterns.Chap4.DomainModel.ModelDO;
using ASPPatterns.Chap4.DomainModel.Repository;

namespace ASPPatterns.Chap4.DomainModel.AppService
{
    /// <summary>
    /// coordinates the method
    ///calls to the domain entities: service and repository
    /// </summary>
    public class ApplicationBankAccountService
    {
        private BankAccountService _bankAccountService;
        private IBankAccountRepository _bankRepository;

        //poor man's DI
        public ApplicationBankAccountService() : this (new BankAccountRepository(), 
            new BankAccountService(new BankAccountRepository() ))

        {}

        public ApplicationBankAccountService(IBankAccountRepository bankRepository, BankAccountService bankAccountService)
        {
            _bankAccountService = bankAccountService;
            _bankRepository = bankRepository;
        }

        public ApplicationBankAccountService(BankAccountService bankAccountService, IBankAccountRepository bankRepository)
        {
            _bankAccountService = bankAccountService;
            _bankRepository = bankRepository;
        }

        public BankAccountCreateResponse CreateBankAccount(BankAccountCreateRequest bankAccountCreateRequest)
        {
            BankAccountCreateResponse bankAccountCreateResponse = new BankAccountCreateResponse();
            BankAccount bankAccount = new BankAccount();

            bankAccount.CustomerRef = bankAccountCreateRequest.CustomerName;
            _bankRepository.Add(bankAccount);

            return bankAccountCreateResponse;
        }

        public void Deposit(DepositRequest depositRequest)
        {
            BankAccount bankAccount = _bankRepository.FindBy(depositRequest.AccountId);
            bankAccount.Deposit(depositRequest.Amount, "");

            _bankRepository.Save(bankAccount);
        }

        public void Withdrawal(WithdrawalRequest withdrawalRequest)
        {
            BankAccount bankAccount = _bankRepository.FindBy(withdrawalRequest.AccountId);
            bankAccount.WithDraw(withdrawalRequest.Amount, "");

            _bankRepository.Save(bankAccount);
        }

        public TransferResponse Transfer(TransferRequest request)
        {
            TransferResponse response = new TransferResponse();

            try
            {
                _bankAccountService.Transfer(request.AccountIdTo, request.AccountIdFrom, request.Amount);
                response.Success = true;
            }
            catch(InsufficientFundsException)
            {
                response.Message = "There is not enough funds in account no: " + request.AccountIdFrom.ToString();
                response.Success = false;
            }

            return response;

        }
        


    }
}
