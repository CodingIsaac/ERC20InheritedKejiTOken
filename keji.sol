
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;  

/**

1. Create a token using open Zeppelin Standard.
2. Import OpenZeppelin Stanadard code using Github.
3. Using Overide Create a model for your own Token to tweak the logic of the contract created
4. State the Token name, set decimal to zero, 



*/

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract Erc20Token is ERC20 ("Keji", "MKJ") {


    mapping (address => uint) public _balance;


constructor() {
        
        _mint(address(this), 100000);
        
    }

     function decimals() public view virtual override returns (uint8) {
        return 0;
    }

    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        require(_balance[to] >= amount);
        address owner = _msgSender();
        _transfer(owner, to, amount);
        
        return true;
    }

    function withdrawToken(uint amount) public returns(bool) {
        
        // uint _amount = balanceOf(address(this));
        require(_balance[address(this)] >= amount);
        _transfer(address(this), msg.sender, amount);



        return true;

    }



}


