package com.spike.dao;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spike.dto.AccountDTO;
import com.spike.dto.UserDTO;
import com.spike.repository.AccountRepository;

@Repository
public class AccountDAOImpl implements AccountDAO {

    @Autowired
    private AccountRepository accountrepo;

    @PersistenceContext
    private EntityManager em;

    @Override
    public void createAccount(AccountDTO s) {
        this.accountrepo.save(s);
    }

    @Override
    public void Oneupdateaccount(Long oneLimit, String accountNumber) {
        this.accountrepo.Oneupdateaccount(oneLimit, accountNumber);
    }

    @Override
    public void Dayupdateaccount(Long dayLimit, String accountNumber) {
        this.accountrepo.Dayupdateaccount(dayLimit, accountNumber);
    }

    @Override
    public void Passwordupdateaccount(AccountDTO a) {
        this.accountrepo.Passwordupdateaccount(a.getAccountPassword(), a.getAccountNumber());
    }

    @Override
    public AccountDTO findByAccount(String account_number) {
        Optional<AccountDTO> result = this.accountrepo.findByAccount(account_number);

        AccountDTO member;
        if (result.isPresent()) {
            member = result.get();
        } else {
            member = null;
        }
        return member;
    }

    @Override
    public void accountsecession(String accountNumber) {
        this.accountrepo.accountsecession(accountNumber);
    }

    @Override
    public List<AccountDTO> getAllActiveAccounts() {
        return em.createQuery("select a from AccountDTO a where a.accountState = 'ACTIVE'", AccountDTO.class)
                .getResultList();
    }

    @Override
    public void updateAccount(AccountDTO account) {
        this.accountrepo.updateAccount(account);
    }

    @Override
    public List<AccountDTO> findbyAccountInfo(String detailValue) {
        return this.accountrepo.findbyAccountInfo(detailValue);
    }

    @Override
    public List<AccountDTO> findActiveAccountsByUser(UserDTO user) {
        return this.accountrepo.findByOwner(user);
    }

    @Override
    public Optional<AccountDTO> findById(Long accountId) {
        return accountrepo.findById(accountId);
    }

	@Override
	public void updateLimit(UserDTO user) {
		this.accountrepo.updateLimit(user);
	}


	@Override
	public AccountDTO findByAccountId(Long id) {
		return this.accountrepo.findByAccountId(id);
	}

	@Override
	public void updateAccountState(Long accountId, String accountState) {
		this.accountrepo.updateAccountState(accountId, accountState);
	}

}

