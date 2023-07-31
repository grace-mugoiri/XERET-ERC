pragma solidity ^0.4.2;

contract XeretToken {
    // store token name 
    string public name = "XERET Token";
    // store token symbol
    string public symbol = "XRT";
    string public standard = "XERET Token v1.0";
    // store total supply of tokens 
    uint256 public totalSupply;

    event Transfer(
        address indexed _from:
        address indexed _to;
        uint256 _value;
    );

    // store the balance of each account that owns tokens 
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    function XeretToken (uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }

    // allows users to send tokens to another account 
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        Transfer(msg.sender, _to, _value);
        return true;
    }

    // allows another account to spend tokens 
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;

        Approval(msg.sender, _spender, -value);
        
        return true;
    }

    // allows another account to transfer tokens 
    function transferFrom(address, _from, address _to, uint256 _value) public returns (bool success){
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);

        balanceOf[_from] -= _value;
        balacneOf(_to) += _value;

        allowance[_from][msg.sender] -= _value;
        
        Transfer(_from, _to, _value)

        return true;
    }
}