# Order-Book Imbalance Predictor & Execution Simulator

## Overview
This project builds a full pipeline to predict short-term price movements from limit order-book (LOB) data and simulate optimized trade execution. Key components include data ingestion, feature engineering, advanced modeling, backtesting against benchmarks, and transaction-cost analysis. The goal is to demonstrate how imbalance signals can improve execution quality and reduce slippage relative to standard benchmarks.

## Contact Information
For questions or collaboration: 
Name: Kenneth (Future Quant Reseracher) 

Email: kennethlegare5@gmail.com 

GitHub: https://github.com/kenneth/orderbook-imbalance-sim

## Problem Statement
Financial markets generate vast streams of order-book updates. Traders face two challenges:

1. Extract predictive signals from LOB dynamics to anticipate immediate price moves.

2. Use those signals to schedule child orders and minimize execution costs compared to benchmarks like TWAP or VWAP.

This project addresses both by engineering microstructural and cross-asset features, training statistical and deep-learning models, and simulating an execution strategy in a reproducible framework.


## Technology Used

Layer	Tools & Libraries
Data Processing	Python, pandas, Dask, pyarrow
Feature Engineering	NumPy, pandas
Modeling	scikit-learn, PyTorch, River (online learning), stable-baselines3
Backtesting	Custom engine (Python), Zipline-style simulation
Visualization	matplotlib, seaborn
MLOps	Docker, MLflow, Prefect
Testing & CI/CD	pytest, flake8, GitHub Actions

## Steps to Solution
1. Data Ingestion

- Load raw CSV snapshots from data/raw/limit-orderbook/.

- Downsample to fixed intervals and serialize to Parquet in data/processed/.

2. Feature Engineering

- Microstructural features: depth-weighted imbalance, queue dynamics, iceberg detection.

- Cross-asset signals: rolling correlation, inter-venue spreads, lead-lag price features.

3. Model Training

- Baseline: logistic regression on static features.

- Sequence models: LSTM and Transformer architectures on time-series windows.

- Graph models: GNN capturing LOB as a connectivity graph.

- Hybrid ensembles: combining tree-based and deep models.

- Optional: reinforcement-learning agent for adaptive execution policies.

4. Backtesting & Execution Simulation

- Simulate child-order schedules using predictive signals.

- Benchmarks: TWAP, VWAP, POV, and implementation-shortfall minimization.

- Multi-venue routing logic and transaction-cost analysis (TCA).

5. Evaluation & Visualization

- Compute slippage, PnL impact, and cost vs. benchmarks.

- Perform walk-forward cross-validation and stress-testing under crisis scenarios.

- Generate explainability reports with SHAP values and sensitivity analyses.

## Final Results
Model	Prediction Accuracy	Slippage Improvement vs. TWAP
Logistic Regression	55.2%	3.5 bps
LSTM Sequence Model	60.8%	5.2 bps
Transformer Model	62.1%	5.8 bps
RL-Driven Execution Agent	—	7.1 bps

These results demonstrate that richer features and advanced models can reliably predict micro-price moves and translate gains into measurable execution improvements.


## Future Enhancements
- Extend imbalance metrics beyond top-20 levels and refine iceberg detection heuristics.

- Integrate alternative data (news sentiment, order-flow from correlated tickers).

- Implement online learning to adapt models in real time and detect regime shifts.

- Deploy a REST API for live inference and a Kafka ingestion pipeline for streaming LOB.

- Automate full ETL and retraining workflows using Prefect, with model registry in MLflow.

- Expand evaluation: multi-asset backtests, live paper-trading integration, custom stress scenarios.


