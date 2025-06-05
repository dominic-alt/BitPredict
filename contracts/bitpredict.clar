;; Title: BitPredict - Decentralized Price Prediction Markets
;;
;; Summary: A trustless prediction market platform built on Stacks blockchain
;; enabling users to stake STX tokens on Bitcoin price movements with automated
;; resolution and proportional reward distribution.
;;
;; Description: BitPredict harnesses the security of Bitcoin through Stacks Layer 2
;; to create a transparent, decentralized prediction market ecosystem. Users can
;; participate in price prediction markets by staking STX tokens on whether Bitcoin's
;; price will move up or down within specified timeframes. The platform features
;; oracle-based price resolution, automated reward calculations, and built-in fee
;; mechanisms for sustainable operation. All market data is stored immutably on-chain,
;; ensuring transparency and eliminating counterparty risk.

;; CONSTANTS

;; Administrative Constants
(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))

;; Error Codes
(define-constant err-not-found (err u101))
(define-constant err-invalid-prediction (err u102))
(define-constant err-market-closed (err u103))
(define-constant err-already-claimed (err u104))
(define-constant err-insufficient-balance (err u105))
(define-constant err-invalid-parameter (err u106))

;; STATE VARIABLES

;; Platform Configuration
(define-data-var oracle-address principal 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM)
(define-data-var minimum-stake uint u1000000) ;; 1 STX minimum stake
(define-data-var fee-percentage uint u2) ;; 2% platform fee
(define-data-var market-counter uint u0)

;; DATA MAPS

;; Market Data Structure
(define-map markets
  uint
  {
    start-price: uint,
    end-price: uint,
    total-up-stake: uint,
    total-down-stake: uint,
    start-block: uint,
    end-block: uint,
    resolved: bool,
  }
)

;; User Predictions Tracking
(define-map user-predictions
  {
    market-id: uint,
    user: principal,
  }
  {
    prediction: (string-ascii 4),
    stake: uint,
    claimed: bool,
  }
)