<changeSet author="CHANGEME" id="CHANGEME">
<createTable tableName="cargos" remarks="Tabela de cargo dos empregados">
  <column name="id_cargo" type="VARCHAR(10)" remarks="Chave primaria">
    <constraints nullable="false"/>
  </column>
  <column name="cargo" type="VARCHAR(35)" remarks="Cargo que ocupa">
    <constraints nullable="false"/>
  </column>
  <column name="salario_minimo" type="DECIMAL(8,2)" remarks="Sal&#225;rio m&#237;nimo"/>
  <column name="salario_maximo" type="DECIMAL(8,2)" remarks="Sal&#225;rio m&#225;ximo"/>
</createTable>
<addPrimaryKey tableName="cargos" constraintName="cargos_pk" columnNames="id_cargo"/>

<createIndex tableName="cargos" indexName="cargos_idx" unique="true">
  <column name="cargo"/>
</createIndex>

<createTable tableName="regioes" remarks="Tabelas das regi&#245;es">
  <column name="id_regiao" type="INTEGER" remarks="Chave estrangeira">
    <constraints nullable="false"/>
  </column>
  <column name="nome" type="VARCHAR(25)" remarks="Nome regi&#227;o">
    <constraints nullable="false"/>
  </column>
</createTable>
<addPrimaryKey tableName="regioes" constraintName="regioes_pk" columnNames="id_regiao"/>

<createIndex tableName="regioes" indexName="regioes_idx" unique="true">
  <column name="nome"/>
</createIndex>

<createTable tableName="paises" remarks="tabela de pa&#237;ses">
  <column name="id_pais" type="CHAR(2)" remarks="Chave estrangeira">
    <constraints nullable="false"/>
  </column>
  <column name="nome" type="VARCHAR(50)" remarks="Nome do pa&#237;s">
    <constraints nullable="false"/>
  </column>
  <column name="id_regiao" type="INTEGER" remarks="Chave estrangeira regi&#245;es"/>
</createTable>
<addPrimaryKey tableName="paises" constraintName="paises_pk" columnNames="id_pais"/>

<createTable tableName="localizacoes" remarks="Tabela que mostra as localiza&#231;&#245;es">
  <column name="id_localizacao" type="INTEGER" remarks="Chave primaria">
    <constraints nullable="false"/>
  </column>
  <column name="endereco" type="VARCHAR(50)" remarks="endere&#231;o"/>
  <column name="cep" type="VARCHAR(12)" remarks="cep"/>
  <column name="cidade" type="VARCHAR(50)" remarks="cidade"/>
  <column name="uf" type="VARCHAR(25)" remarks="Estado"/>
  <column name="id_pais" type="CHAR(2)" remarks="Chave estrangeira pa&#237;ses"/>
</createTable>
<addPrimaryKey tableName="localizacoes" constraintName="localizacoes_pk" columnNames="id_localizacao"/>

<createTable tableName="departamentos" remarks="Tabela de departamento das empresas">
  <column name="id_departamento" type="INTEGER" remarks="Chave prim&#225;ria">
    <constraints nullable="false"/>
  </column>
  <column name="nome" type="VARCHAR(50)" remarks="Nome departamento"/>
  <column name="id_localizacao" type="INTEGER" remarks="Chave estrangeira localiza&#231;&#245;es"/>
  <column name="id_gerente" type="INTEGER" remarks="Chave estrangeira gerente"/>
</createTable>
<addPrimaryKey tableName="departamentos" constraintName="departamentos_pk" columnNames="id_departamento"/>

<createTable tableName="empregados" remarks="Tabela de empregados da empresa">
  <column name="id_empregado" type="INTEGER" remarks="Chave prim&#225;ria">
    <constraints nullable="false"/>
  </column>
  <column name="nome" type="VARCHAR(75)" remarks="Nome empregado">
    <constraints nullable="false"/>
  </column>
  <column name="email" type="VARCHAR(35)" remarks="E-mail empregado">
    <constraints nullable="false"/>
  </column>
  <column name="telefone" type="VARCHAR(20)" remarks="Telefone empregado"/>
  <column name="data_contratacao" type="DATE" remarks="Quando foi contratado">
    <constraints nullable="false"/>
  </column>
  <column name="id_cargo" type="VARCHAR(10)" remarks="Chave estrageira cargos">
    <constraints nullable="false"/>
  </column>
  <column name="salario" type="DECIMAL(8,2)" remarks="Sal&#225;rio que recebe"/>
  <column name="comissao" type="DECIMAL(4,2)" remarks="Comiss&#227;o que vai receber"/>
  <column name="id_departamento" type="INTEGER" remarks="Chave estrangeira departamentos"/>
  <column name="id_supervisor" type="INTEGER" remarks="chave estrageira supervisor"/>
</createTable>
<addPrimaryKey tableName="empregados" constraintName="empregados_pk" columnNames="id_empregado"/>

<createIndex tableName="empregados" indexName="empregados_idx" unique="true">
  <column name="email"/>
</createIndex>

<createTable tableName="historico_cargos" remarks="tabela do hist&#243;rico de cargos dos funcion&#225;rios">
  <column name="id_empregado" type="INTEGER" remarks="Chave primaria tipo c&#243;digo">
    <constraints nullable="false"/>
  </column>
  <column name="data_inicial" type="DATE" remarks="Chave primaria, data de inicio">
    <constraints nullable="false"/>
  </column>
  <column name="data_final" type="DATE" remarks="Data final no cargo">
    <constraints nullable="false"/>
  </column>
  <column name="id_cargo" type="VARCHAR(10)" remarks="Chave estrangeira cargos">
    <constraints nullable="false"/>
  </column>
  <column name="id_departamento" type="INTEGER" remarks="Chave estrangeira departamentos"/>
</createTable>

<addForeignKeyConstraint baseTableName="empregados" constraintName="cargos_empregados_fk" baseColumnNames="id_cargo" referencedTableName="cargos" referencedColumnNames="id_cargo"/>

<addForeignKeyConstraint baseTableName="historico_cargos" constraintName="cargos_historico_cargos_fk" baseColumnNames="id_cargo" referencedTableName="cargos" referencedColumnNames="id_cargo"/>

<addForeignKeyConstraint baseTableName="paises" constraintName="regioes_paises_fk" baseColumnNames="id_regiao" referencedTableName="regioes" referencedColumnNames="id_regiao"/>

<addForeignKeyConstraint baseTableName="localizacoes" constraintName="paises_localizacoes_fk" baseColumnNames="id_pais" referencedTableName="paises" referencedColumnNames="id_pais"/>

<addForeignKeyConstraint baseTableName="departamentos" constraintName="localizacoes_departamentos_fk" baseColumnNames="id_localizacao" referencedTableName="localizacoes" referencedColumnNames="id_localizacao"/>

<addForeignKeyConstraint baseTableName="empregados" constraintName="departamentos_empregados_fk" baseColumnNames="id_departamento" referencedTableName="departamentos" referencedColumnNames="id_departamento"/>

<addForeignKeyConstraint baseTableName="historico_cargos" constraintName="departamentos_historico_cargos_fk" baseColumnNames="id_departamento" referencedTableName="departamentos" referencedColumnNames="id_departamento"/>

<addForeignKeyConstraint baseTableName="departamentos" constraintName="empregados_departamentos_fk" baseColumnNames="id_gerente" referencedTableName="empregados" referencedColumnNames="id_empregado"/>

<addForeignKeyConstraint baseTableName="empregados" constraintName="empregados_empregados_fk" baseColumnNames="id_supervisor" referencedTableName="empregados" referencedColumnNames="id_empregado"/>

<addForeignKeyConstraint baseTableName="historico_cargos" constraintName="empregados_historico_cargos_fk" baseColumnNames="id_empregado" referencedTableName="empregados" referencedColumnNames="id_empregado"/>
</changeSet>
