# Agentic Development Workflow V2.0: An Overview

This document outlines a revised, three-phase workflow for modern agentic software development. It leverages the distinct strengths of prompt-driven ideation, structured context management, and intelligent task execution to create a seamless, scalable, and context-aware process. This workflow is designed to move beyond simple prompting into a structured, repeatable engineering discipline.

## The Three Pillars

Our framework integrates three specialized components, each playing a critical role:

1.  **AI-Product-Development-Toolkit (Ideation):** The starting point for any new project. This collection of prompts facilitates a "guided conversation" with an AI to produce a rich set of initial, narrative documents (PRD, MVP Concept, UX Flows), capturing the project's initial vision.

2.  **The Memory Bank (Long-Term Context):** The project's "soul" and canonical source of truth. The Memory Bank is a structured directory of markdown files, each with a specific purpose (`projectBrief.md`, `techContext.md`, etc.). It organizes the raw ideas from the ideation phase into a persistent, holistic knowledge base that guides all development activities.

3.  **Task-Master (Execution Engine):** The project's "central nervous system." Task-Master uses an LLM to parse a single, comprehensive, *narrative* PRD—one that tells the story of the project. It intelligently extracts tasks, dependencies, and requirements from prose, generating a structured `tasks.json` file that serves as the concrete, step-by-step project plan.

## The Integrated Workflow

This workflow ensures that the narrative vision is translated into a structured knowledge base, which is then used to create an actionable plan that is executed with full context.

* **Phase 1: Project Initiation and Knowledge Structuring.** The workflow begins with broad ideation, using the AI-Product-Development-Toolkit to explore and document the project's vision. The key insights and requirements from these documents are then systematically synthesized and organized into the structured files of the Memory Bank, creating a canonical, long-term context.

* **Phase 2: Task Generation and Planning.** This is the critical translation phase. A single, well-written, and descriptive narrative PRD is authored. This document is not a simple checklist; it is a comprehensive story of the project, drawing its facts and structure directly from the Memory Bank. This purpose-built document is then fed to Task-Master, which uses its AI capabilities to "read" the narrative and generate a nuanced and intelligent `tasks.json` plan.

* **Phase 3: Agentic Development and Iteration.** This is the ongoing development cycle. The agent, guided by the developer, uses Task-Master commands to select and execute tasks from the generated plan. Crucially, for each task, the agent is prompted to adhere to the principles and patterns stored in the Memory Bank. As tasks are completed, a feedback loop ensures the Memory Bank is continuously updated with new learnings, architectural decisions, and progress logs, keeping the project's context alive and synchronized with the codebase.
