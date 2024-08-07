-- Active: 1722872967942@@127.0.0.1@5432@postgres@public


-- Inserindo dados na tabela professor
DO $$
BEGIN
    FOR i IN 1..30 LOOP
        INSERT INTO professor (nome, fone) VALUES 
        ('Professor ' || i, '99999-' || LPAD(i::TEXT, 4, '0'));
    END LOOP;
END $$;

-- Inserindo dados na tabela disciplina
DO $$
BEGIN
    FOR i IN 1..50 LOOP
        INSERT INTO disciplina (nome, ano) VALUES 
        ('Disciplina ' || i, 2000 + (i % 4));
    END LOOP;
END $$;

-- Inserindo dados na tabela aluno
DO $$
BEGIN
    FOR i IN 1..30 LOOP
        INSERT INTO aluno (nome) VALUES 
        ('Aluno ' || i);
    END LOOP;
END $$;

-- Inserindo dados na tabela professor_disciplina
DO $$
BEGIN
    FOR i IN 1..30 LOOP
        INSERT INTO professor_disciplina (codp, codd) VALUES 
        (i, i);
    END LOOP;
    FOR i IN 1..30 LOOP
        INSERT INTO professor_disciplina (codp, codd) VALUES 
        (i, (i % 30) + 1);
    END LOOP;
END $$;

-- Inserindo dados na tabela aluno_disciplina
DO $$
BEGIN
    FOR i IN 1..10 LOOP
        INSERT INTO aluno_disciplina (coda, codd) VALUES 
        (i, i);
    END LOOP;
    FOR i IN 1..10 LOOP
        INSERT INTO aluno_disciplina (coda, codd) VALUES 
        (i, (i % 10) + 1);
    END LOOP;
    FOR i IN 1..10 LOOP
        INSERT INTO aluno_disciplina (coda, codd) VALUES 
        (i, ((i + 10) % 10) + 1);
    END LOOP;
END $$;



-- Limpar todas as relações existentes na tabela professor_disciplina
DELETE FROM professor_disciplina;

-- Adicionar registros onde todos os professores lecionam "Disciplina 1" e "Disciplina 2"
DO $$
BEGIN
    FOR i IN 1..30 LOOP
        -- Todos os professores lecionam "Disciplina 1"
        INSERT INTO professor_disciplina (codp, codd) VALUES (i, 1);
        -- Todos os professores lecionam "Disciplina 2"
        INSERT INTO professor_disciplina (codp, codd) VALUES (i, 2);
    END LOOP;
END $$;