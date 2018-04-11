pragma solidity ^0.4.18;

import "../Auxiliary/Pausable.sol";
import "../Auxiliary/Mortal.sol";
import "../Auxiliary/StaticAddressLibrary.sol";


contract AgencyControl is Pausable, Mortal {

    address public ceoAddress;
    address public cfoAddress;
    address public cooAddress;

    function AgencyControl() public {
    }



    /// @dev Access modifier for CEO-only functionality
    modifier onlyCEO() {
        require(msg.sender == ceoAddress);
        _;
    }

    /// @dev Access modifier for CFO-only functionality
    modifier onlyCFO() {
        require(msg.sender == cfoAddress);
        _;
    }

    /// @dev Access modifier for COO-only functionality
    modifier onlyCOO() {
        require(msg.sender == cooAddress);
        _;
    }


    /// @dev Access modifier for C-level-only functionality
    modifier onlyCLevel() {
        require(
            msg.sender == ceoAddress||msg.sender == cfoAddress||msg.sender == cooAddress
        );
        _;
    }



    /// @dev Assigns a new address to act as the CEO. Only available to the current CEO.
    /// @param _newCEO The address of the new CEO
    function setCEO(address _newCEO) external onlyOwner returns (address) {
        require(_newCEO != address(0));

        ceoAddress = _newCEO;
        return ceoAddress;
    }

    /// @dev Assigns a new address to act as the CFO. Only available to the current CEO.
    /// @param _newCFO The address of the new CFO
    function setCFO(address _newCFO) external onlyOwner {
        require(_newCFO != address(0));

        cfoAddress = _newCFO;
    }

    function setCOO(address _newCOO) external onlyOwner {
        require(_newCOO != address(0));

        cooAddress = _newCOO;
    }


}


