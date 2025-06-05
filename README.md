# Blockchain-Based Marketing Attribution Analytics

This project implements a blockchain-based marketing attribution analytics system using Clarity smart contracts. The system provides transparent, immutable tracking of marketing campaigns, customer journeys, and ROI calculations while ensuring privacy compliance.

## Overview

The system consists of five core smart contracts:

1. **Advertiser Verification Contract**: Validates and manages marketing advertisers
2. **Campaign Tracking Contract**: Tracks marketing campaigns and their performance metrics
3. **Customer Journey Contract**: Maps customer touchpoints and interactions across campaigns
4. **ROI Calculation Contract**: Calculates return on investment for marketing campaigns
5. **Privacy Compliance Contract**: Ensures marketing activities comply with privacy regulations

## Smart Contracts

### Advertiser Verification Contract

This contract manages the verification of advertisers on the platform:

- Verify and revoke verification for advertisers
- Check if an advertiser is verified
- Transfer admin rights

### Campaign Tracking Contract

This contract tracks marketing campaigns and their performance:

- Create new marketing campaigns
- Update campaign metrics (impressions, clicks, conversions, spend)
- Retrieve campaign details and metrics
- Deactivate campaigns

### Customer Journey Contract

This contract maps customer interactions across marketing touchpoints:

- Record customer touchpoints with campaigns
- Support multiple attribution models (last-touch, first-touch, linear)
- Retrieve customer journey data

### ROI Calculation Contract

This contract calculates and tracks ROI for marketing campaigns:

- Calculate ROI based on revenue and cost data
- Store historical ROI data for campaigns
- Retrieve ROI metrics

### Privacy Compliance Contract

This contract ensures marketing activities comply with privacy regulations:

- Manage customer privacy settings and consent
- Process data deletion requests
- Track compliance with privacy regulations

## Usage

### Advertiser Verification

```clarity
;; Verify an advertiser
(contract-call? .advertiser-verification verify-advertiser 'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG)

;; Check if an advertiser is verified
(contract-call? .advertiser-verification is-verified 'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG)
