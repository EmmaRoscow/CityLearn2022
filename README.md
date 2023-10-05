# CityLearn
CityLearn is an open source OpenAI Gym environment for the implementation of Multi-Agent Reinforcement Learning (RL) for building energy coordination and demand response in cities. A major challenge for RL in demand response is the ability to compare algorithm performance. Thus, CityLearn facilitates and standardizes the evaluation of RL agents such that different algorithms can be easily compared with each other.

The CityLearn Challenge 2022 was hosted by [AICrowd](https://www.aicrowd.com/challenges/neurips-2022-citylearn-challenge) with the aim of developing models that reduce both electricity cost and carbon emissions by controlling the charging and discharging of electricity battery storage.

In this project (ongoing, as of October 2023) my aim is to:
* establish baselines for the task (see "EDA and baselines" notebook)
* develop a proximal policy optimisation (PPO) algorithm (see "ppo" notebook)
* implement a state-of-the-art reinforcement learning algorithm for comparison, e.g. [Dreamer](https://danijar.com/project/dreamerv3/)
