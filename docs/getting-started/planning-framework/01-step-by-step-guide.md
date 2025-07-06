# Agentic Workflow V2.0: Step-by-Step Guide

This guide provides detailed instructions for implementing the advanced agentic development workflow. Following these steps will ensure your project is built on a foundation of clear requirements, persistent context, and structured execution.

---

### **Phase 1: Project Initiation and Knowledge Structuring**

**Goal:** To transform a raw idea into a structured, persistent knowledge base.

#### **Step 1.1: Generate Core Documents via Guided Conversation**

Use the prompts from the **AI-Product-Development-Toolkit** as a foundation for a "Socratic" dialogue with a powerful LLM (like Claude 3, GPT-4, or Gemini 1.5 Pro).

* **Action:** Sequentially use prompts like `Guided-PRD-Creation.md` and `MVP-Concept.md` to produce a rich set of initial planning documents.
* **Best Practice:** Enhance the base prompts by providing the AI with a clear persona (e.g., "You are a senior product manager"), detailed background information, and specific formatting instructions.
* **Output:** A collection of narrative markdown files (e.g., `Initial_PRD.md`, `MVP_Concept.md`, etc.).

#### **Step 1.2: Establish the Memory Bank Structure**

The Memory Bank provides the structured home for your project's long-term context.

* **Action:** Create the `/docs/memory-bank/` directory and populate it with the standard set of markdown files. An MCP server like `ipospelov/mcp-memory-bank` can automate this.
* **Structure:**
    ```
    /docs/memory-bank/
    ├── activeContext.md
    ├── productContext.md
    ├── progress.md
    ├── projectBrief.md
    ├── systemPatterns.md
    └── techContext.md
    ```

#### **Step 1.3: Populate the Memory Bank Files**

This is a critical synthesis step. Read through the core documents generated in Step 1.1 and distill the information into the appropriate Memory Bank files. This organizes the knowledge and makes it canonical.

* **`projectBrief.md`**: The "at a glance" summary. Extract the high-level vision, core problem statement, and key business objectives.
* **`productContext.md`**: The user-centric view. Detail user personas, user stories, and the specific pain points the project addresses.
* **`systemPatterns.md`**: The high-level architectural blueprint. Document initial thoughts on system architecture, major components, and data flows.
* **`techContext.md`**: The developer's handbook. List the proposed technologies, frameworks, libraries, and any known technical constraints.
* **`progress.md`**: The log of achievements. Initially, this can be seeded with a checklist of the MVP features (all marked as 'pending').
* **`activeContext.md`**: The current focus. To start, this can state: "Project initialized. Awaiting task decomposition."

---

### **Phase 2: Task Generation and Planning**

**Goal:** To convert the structured knowledge in the Memory Bank into a concrete, actionable project plan using Task-Master.

#### **Step 2.1: Craft the Narrative PRD for Task-Master**

This is the most significant change from older workflows. Task-Master's AI is powerful and works best with a rich, descriptive document, not a simple list.

* **Action:** Create a new file: `/docs/prd.md`.
* **Action:** Author a comprehensive, prose-based narrative of your project inside this file. **Use the populated Memory Bank files as your single source of truth.**
* **Recommended Structure for `prd.md`:**
    1.  **Introduction and Vision:** Start with the high-level project vision from `projectBrief.md`.
    2.  **Problem Statement and User Personas:** Describe the "why" and "who" using the detailed descriptions from `productContext.md`.
    3.  **Core Features and Functionality:** Describe the required features in prose, as if telling a story about how the product will work and solve user problems. This section is the core of the document.
    4.  **Technical Plan and Architecture:** Incorporate the key architectural decisions, system patterns, and technology stack from `systemPatterns.md` and `techContext.md`.
* **Output:** A single, well-written `/docs/prd.md` file that Task-Master can "read" and understand.

#### **Step 2.2: Generate the Task List with Task-Master**

* **Action:** Use your AI agent (e.g., in a Cursor chat) with a conversational prompt.
    > "Please use Task-Master to parse the narrative PRD located in `/docs/prd.md` and generate the project task list."
* **Under the Hood:** The agent will execute the command:
    ```bash
    task-master parse-prd docs/prd.md
    ```
* **Output:** A `.taskmaster/tasks.json` file containing the AI-generated task list, complete with inferred titles, details, priorities, and dependencies.

#### **Step 2.3: Review, Refine, and Generate**

* **Action:** Manually review the `tasks.json` file. Verify that the AI correctly interpreted your narrative and that the task dependencies are logical.
* **Action (Optional):** For any task that seems too large, use the `expand` command to break it into smaller sub-tasks:
    ```bash
    task-master expand --id=<task_id>
    ```
* **Action:** Generate individual, human-readable task files for easy reference.
    ```bash
    task-master generate
    ```
* **Output:** A `/tasks/` directory containing files like `task_001.txt`, `task_002.txt`, etc.

---

### **Phase 3: Agentic Development and Iteration**

**Goal:** To execute the plan efficiently while keeping the project's context synchronized.

#### **Step 3.1: The Symbiotic Development Loop**

This is the day-to-day cycle of building the software.

1.  **Select Task:** Ask your agent, "What is the next task?" The agent should run:
    ```bash
    task-master next
    ```
2.  **Implement with Context:** Prompt the agent to implement the selected task. **This prompt is crucial.**
    > "Implement the requirements outlined in `@tasks/task_005.txt`. During implementation, you **must** adhere to the architectural principles and technology constraints documented in the `@docs/memory-bank/` directory to ensure consistency."
3.  **Update Task State:** Once the feature is coded, tested, and merged, instruct the agent to mark the task as complete.
    ```bash
    task-master update --id=5 --status=done
    ```

#### **Step 3.2: The Critical Feedback Loop (Maintain the Memory Bank)**

This step is non-negotiable for preventing context drift. The Memory Bank is a living document.

* **Action:** After completing a significant task, instruct the agent to persist the new knowledge.
    > "The authentication feature was just implemented using Passport.js. Please update the Memory Bank to reflect this. Specifically, summarize this decision in `activeContext.md`, add 'Passport.js' to `techContext.md`, and document the new authentication flow pattern in `systemPatterns.md`."
* **Action:** Regularly update `progress.md` with a log of the completed task and update `activeContext.md` to reflect the new focus. This ensures the AI agent always has the most current and accurate context for the next task.

---

### **Applying the Workflow to Existing Projects**

You can bootstrap this workflow onto a mature codebase using a "retrospective" approach.

1.  **Reverse-Engineer the PRD:** Instruct an AI agent with full codebase access (`@Codebase`) to document the *current* state of the application by authoring a comprehensive, narrative `/docs/prd.md` that describes all existing features as if you were planning them today.
2.  **Populate the Memory Bank:** Use the same technique to have the agent analyze the codebase and populate all the files in `/docs/memory-bank/` with the current architecture, tech stack, product context, etc.
3.  **Generate the Full Task List:** Run `task-master parse-prd docs/prd.md` and `task-master generate`. This will create a `tasks.json` where all existing features are incorrectly marked as "pending."
4.  **Reconcile Task Status via AI:** Use the agent to synchronize state.
    > "Read the entire project codebase. Now, read the `.taskmaster/tasks.json` file. For each task, determine if its requirements have already been fully implemented in the code. Provide me with a list of all task IDs that are complete."
5.  **Bulk-Update Task Status:** Use the list from the agent to run `task-master update --id=<id> --status=done` for all completed tasks.
6.  **Continue Development:** Your `tasks.json` and Memory Bank now accurately reflect the project's current state. You can seamlessly begin new work by running `task-master next`, which will identify the first truly new feature to be built.
