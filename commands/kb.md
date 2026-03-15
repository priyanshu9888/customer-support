# /kb — Knowledge Base Management

Load, search, and manage support knowledge base documents.
Loaded documents are used by ALL agents in every command.

## Usage
```
/kb add <file>        Load a document into the KB
/kb list              Show all loaded documents with token counts
/kb search <query>    Search loaded KB for relevant content
/kb clear             Remove all loaded documents
/kb stats             Show total token usage across KB
```

## Supported File Types
| Type | Best for |
|------|----------|
| `.md` `.txt` | Runbooks, SOPs, escalation matrices, playbooks |
| `.pdf` | Architecture docs, compliance docs, product manuals |
| `.xlsx` `.csv` | Incident history, known issues database, SLA tables |
| `.json` | Structured incident exports, config documentation |

## Token Efficiency
Documents are compressed before being sent to each agent:
- Strips boilerplate, navigation, copyright footers
- Removes excess whitespace
- Truncates at 5,500 words per document
- Shows raw → compressed token counts so you can see savings

## Examples
```
/kb add ./runbooks/api-gateway.md
/kb add ./incidents/2024-incidents.xlsx
/kb add ./docs/escalation-matrix.pdf
/kb add ./wiki/known-issues.md

/kb search "connection pool exhaustion"
/kb search "EU-West incidents 2024"

/kb list
/kb stats
/kb clear
```

## Impact on Agents
Once KB is loaded, every agent automatically:
- Searches KB for relevant runbooks before generating fix steps
- Checks KB for past incidents with matching root cause
- Surfaces escalation paths from KB
- Identifies and reports gaps in KB coverage
