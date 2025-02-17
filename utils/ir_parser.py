import hashlib
import sys
import os


def hash_content(content):
    return hashlib.sha256(content.encode()).hexdigest()

def extract_and_save_blocks(filename):
    with open(filename, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    sql_blocks = []
    ir_blocks = []
    
    capturing_sql = False
    capturing_ir = False
    current_sql = []
    current_ir = []
    
    for line in lines:
        if "SQL query" in line and "End" not in line:
            capturing_sql = True
            current_sql = []
            continue
        elif "End of SQL query" in line:
            capturing_sql = False
            sql_blocks.append("".join(current_sql))
            continue
        
        if "IR for the GPU" in line:
            capturing_ir = True
            current_ir = []
            continue
        elif "End of IR" in line:
            capturing_ir = False
            ir_blocks.append("".join(current_ir))
            continue
        
        if capturing_sql:
            current_sql.append(line)
        if capturing_ir:
            current_ir.append(line)
    
    for sql, ir in zip(sql_blocks, ir_blocks):
        content_hash = hash_content(sql)[:8]
        sql_filename = f"{content_hash}.sql"
        ir_filename = f"{content_hash}.ir"
        
        with open("queryplans/"+sql_filename, 'w', encoding='utf-8') as sql_file:
            sql_file.write(sql)
        
        with open("queryplans/"+ir_filename, 'w', encoding='utf-8') as ir_file:
            ir_file.write(ir)
        
        print(f"Saved: {sql_filename}, {ir_filename}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        log_file = "../log/heavydb.IR"
    else:
        log_file = sys.argv[1]

    if not os.path.exists(log_file):
        print("Error: File does not exist")
        sys.exit(1)
    
    extract_and_save_blocks(log_file)