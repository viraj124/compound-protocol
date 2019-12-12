pragma solidity ^0.5.12;
pragma experimental ABIEncoderV2;

import "../../contracts/Governance/Comp.sol";

contract CompScenario is Comp {

    constructor(address account) Comp(account) public {}

    function transferScenario(address[] calldata destinations, uint256 amount) external returns (bool) {
        for (uint i = 0; i < destinations.length; i++) {
            address dst = destinations[i];
            _transferTokens(msg.sender, dst, amount);
        }
        return true;
    }

    function transferFromScenario(address[] calldata froms, uint256 amount) external returns (bool) {
        for (uint i = 0; i < froms.length; i++) {
            address from = froms[i];
            _transferTokens(from, msg.sender, amount);
        }
        return true;
    }

    function generateCheckpoints(uint count, uint offset) external {
        for (uint i = 1 + offset; i <= count + offset; i++) {
            _pushCheckpoint(msg.sender, uint32(i), uint96(i));
        }
    }
}