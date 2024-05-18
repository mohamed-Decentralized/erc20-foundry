// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";
import {IVYToken} from "../src/IVYToken.sol";
import {console} from "forge-std/console.sol";

contract DeployIVY is Script {
    uint256 public constant INITIAL_SUPPLY = 1_000_000 ether;
    uint256 public DEFAULT_PRIVATE_KEY =
        0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;
    string private constant NAME = "IVYToken";
    string private constant SYMBOL = "IVY";

    function run() external returns (IVYToken) {
        uint256 deployerKey;
        if (block.chainid == 11155111) {
            deployerKey = vm.envUint("PRIVATE_KEY");
        } else {
            deployerKey = DEFAULT_PRIVATE_KEY;
        }
        vm.startBroadcast(deployerKey);
        IVYToken ivy = new IVYToken(INITIAL_SUPPLY, NAME, SYMBOL);
        vm.stopBroadcast();
        return ivy;
    }
}
