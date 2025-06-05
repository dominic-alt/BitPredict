# 📈 BitPredict

**BitPredict** is a decentralized price prediction market built on the **Stacks blockchain**, enabling users to stake STX tokens on Bitcoin price movements. The platform ensures trustless execution, on-chain transparency, automated reward distribution, and secure oracle-based market resolution—secured by Bitcoin via Stacks Layer 2.

---

## 🧠 Overview

* **Platform Type:** Decentralized Prediction Market
* **Blockchain:** [Stacks](https://www.stacks.co) (secured by Bitcoin)
* **Token Used:** STX
* **Market Resolution:** Oracle-based
* **Reward Model:** Proportional distribution to correct predictors
* **Fee Model:** Small platform fee taken from winnings
* **Storage:** All market and prediction data is stored on-chain

---

## 🚀 Features

* 🔐 **Trustless Operation**: Eliminates counterparty risk with smart contract automation.
* ⚖️ **Proportional Rewards**: Winners receive rewards based on stake size.
* 📊 **Transparent Markets**: Immutable market and prediction data on-chain.
* 🔄 **Oracle-Resolved**: Markets are settled based on trusted external price feeds.
* 🛠 **Admin Configurability**: Owner-controlled parameters like oracle address, fees, and min stakes.

---

## 📦 Smart Contract Summary

### Constants

* `contract-owner`: The deploying address with administrative control
* Fee, stake, and error constants

### Key Data Maps

* `markets`: Stores each market's details (start price, end price, stake totals, resolution status, etc.)
* `user-predictions`: Stores each user’s prediction, stake, and claim status per market

### Core Public Functions

* `create-market`: Owner creates a new prediction market
* `make-prediction`: Users stake STX on either "up" or "down"
* `resolve-market`: Oracle sets the final price and resolves the outcome
* `claim-winnings`: Users claim their share of winnings after resolution

### Admin Functions

* Update oracle address
* Adjust fee and minimum stake
* Withdraw collected fees

### Read-Only Views

* Get market data, user predictions, platform configuration, and contract balance

---

## 🧱 Architecture

```text
                        ┌────────────────────────────┐
                        │      BitPredict UI         │
                        └────────────┬───────────────┘
                                     │
                                     ▼
                        ┌────────────────────────────┐
                        │    Clarity Smart Contract   │
                        │        (BitPredict)         │
                        └────────────┬───────────────┘
                                     │
          ┌──────────────────────────┼──────────────────────────┐
          ▼                          ▼                          ▼
┌────────────────┐        ┌────────────────────┐      ┌────────────────────┐
│   STX Wallet   │        │   Stacks Blockchain │      │      Oracle        │
└────────────────┘        └────────────────────┘      └────────────────────┘
 User Funds & Auth       On-chain State & Logic        Final Price Input
                            (Markets, Stakes,
                         Resolutions, Claims, etc.)
```

* **UI**: DApp interface allowing users to interact with markets, view balances, and claim rewards.
* **Clarity Contract**: Business logic and fund handling for market creation, predictions, resolution, and rewards.
* **Oracle**: Trusted entity pushing price data to resolve markets (can be replaced with decentralized oracle system in future versions).
* **Stacks Blockchain**: Provides immutable, secure data storage and Bitcoin-level security.

---

## 🛠 Installation & Deployment

> Assumes familiarity with [Clarity](https://docs.stacks.co/write-smart-contracts/clarity-smart-contract-language), [Clarinet](https://docs.hiro.so/clarinet), and [Stacks CLI](https://docs.hiro.so/get-started/stacks-cli).

### Requirements

* Node.js and Clarinet
* STX wallet for deploying contract
* Oracle integration service (e.g., Chainlink adapter or custom script)

### Deploy Contract

```bash
clarinet check        # Lint and check contract
clarinet test         # Run test suite (if available)
clarinet deploy       # Deploy to a testnet or mainnet
```

### Set Oracle (as Owner)

```clarity
(set-oracle-address 'SP....)   ;; Set trusted price oracle
```

---

## 🔒 Security & Trust

* Funds are only held in the contract during prediction phase
* No admin can move user funds arbitrarily
* Code is open and verifiable on-chain
* Oracle resolution is permissioned but can evolve to decentralize

---

## 📝 Future Improvements

* 🟢 Decentralized oracle support
* 🧾 Historical market analytics dashboard
* 📈 Support for other assets beyond BTC
* 🔄 Auto-resolution with on-chain triggers
* 🎮 Gamified UX and seasonal tournaments

---

## 🤝 Contributing

PRs and issue reports are welcome. Please follow the existing coding style and ensure all logic is well-tested.
