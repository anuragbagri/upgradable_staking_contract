# Upgradable Staking Contract

This repository implements an upgradable staking contract system using the proxy pattern. It includes two versions of the staking contract and a proxy contract for seamless upgrades.

## Key Features

- **ContractV1.sol**: Basic staking functionality.
- **ContractV2.sol**: Upgraded version with additional features.
- **Proxy Contract**: Delegates calls via `delegatecall` and handles upgrades dynamically using the fallback function.

## Quick Setup

1. Clone the repository:
   ```bash
   git clone <repository_url>
   cd upgradable_staking_contract
   ```
2. install dependencies:
   ```bash
   npm install
   ```
3. compile contracts:
   ```bash
   forge build
   ```

## Testing Locally

1. run tests:

```bash
  forge test
```

2. upgrade Simulation:

- Deploy the proxy and ContractV1
- Interact with the proxy for staking
- Upgrade to ContractV2 and verify state persistence and new features

- example commands

  ```bash
   forge script scripts/DeployProxy.s.sol --fork-url <RPC_URL>
   forge script scripts/UpgradeToV2.s.sol --fork-url <RPC_URL>

  ```

## Notes

- Test thoroughly in local/testnet environments. not to bes used in Mainnet ...
