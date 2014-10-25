package edu.irabank.dao;

import java.util.List;

import edu.irabank.dto.AccountDetailsDTO;
import edu.irabank.dto.UserDTO;

public interface AccountDAO {

	
	public Boolean addNewAccount(AccountDetailsDTO accountdetailsDTO); // Pass user object as an argument
	
	public Boolean deleteAccount(Integer accountID); //Delete accountDetails of the selected account
	
	public List<AccountDetailsDTO> listAccounts(); //List All accounts in the Account_Details table
	
	public AccountDetailsDTO getAccountDetailsDTOByUserID(Integer userId);



}
