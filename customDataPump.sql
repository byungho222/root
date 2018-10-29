
-- @db   Oracle
-- @desc Excel에 담긴 Data를 DDL 없이 테이블 형식으로 만든다.
--       (1. DDL 리퀘스트 하기가 번거로워서)
--       (2. F_ARRAY_TO_RECORD를 두번쓰면 bhkim이 text.bh랑 매핑될까봐서)
SELECT
    SUBSTR( COLUMN_VALUE, 1, INSTR(COLUMN_VALUE, '|') - 1 ) AS KEYWORD,
    SUBSTR( COLUMN_VALUE, INSTR(COLUMN_VALUE, '|') + 1, LENGTH(COLUMN_VALUE) ) AS URL,
FROM
    TABLE (    
      F_ARRAY_TO_RECORD('
        bhkimTest|https://bh.test,  
        Testbhkim|https://text.bh
      ', ',')                       -- 첫번째 인자 : sheet의 데이터를 단순히 String으로 가공하였음
    );
