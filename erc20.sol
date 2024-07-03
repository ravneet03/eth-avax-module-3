// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.7.0/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {

    address private owner;

    constructor() ERC20("SLOY", "SLY") {
        owner = msg.sender;
        _mint(owner, 100 * 10 ** uint(decimals()));
    }

    modifier authenticate() {
        require(owner == msg.sender, "Not authorized");
        _;
    }

    function mint(address receiver, uint256 amount) public authenticate {
        _mint(receiver, amount);
    }

    function burn(address receiver, uint256 amount) public {
        _burn(receiver, amount);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
}
