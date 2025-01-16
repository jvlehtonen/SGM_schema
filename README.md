# SGM_schema
Schema for MariaDB database that has pathogenicity predictions for a gene

The 'cdna' could be considered the main table; one entry per unique c.dna change (aka HGVSc).
Each c.dna change may have data in ClinVar and gnomAD databases. A 'variant' is observed change
in protein sequence (HGVSp) that affects how the change affects protein.

The 'syngap' and 'syngap_structural' tables hold collected or computed predictions about variants.


```
+----------------------+
| Tables_in_syngap     |
+----------------------+
| aminoacids           |
| cdna                 |
| clinvar              |
| clinvar_germline     |
| clinvar_review       |
| gnomAD               |
| syngap               |
| syngap_domain        |
| syngap_structural    |
| syngap_verdict       |
+----------------------+
```

```
+----------------------+
| Views_in_syngap      |
+----------------------+
| HGVSp_to_variant     |
| cdna_count           |
| for_HGVSp_to_variant |
| for_csv              |
| for_datatable        |
+----------------------+
```

```mermaid
erDiagram
    clinvar ||--o| cdna : a
    gnomAD ||--o| cdna : a
    cdna }|--|| syngap : a
    syngap ||--o| syngap_structural : a
    clinvar{
        int uid PK
    }
    gnomAD{
        string id PK
    }
    cdna{
        string cdna_change PK
        int basenum
        string variant
        int resnum
        int clinvar_uid
        string gnomad_id
    }
    syngap{
        string variant PK
    }
    syngap_structural{
        string variant PK
    }
```

## Installation
* 'tables.sql' has the tables
* 'functions.sql' adds functions that create verbal predictions for scores
* 'views.sql' adds views/queries that combine columns for "single tables".
  Views depend on functions and tables

Create preferably two SQL users, one with write access and second with read-only.
Use the first for content updates and the second on website that shows content to public.
