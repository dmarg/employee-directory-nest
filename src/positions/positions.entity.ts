import { Employee } from './../employees/employees.entity';
import { Entity, Column, PrimaryGeneratedColumn, BeforeInsert, ManyToOne, RelationId, JoinColumn } from 'typeorm';
import { Field, ID, ObjectType, Int } from 'type-graphql';
import { Department } from 'src/departments/departments.entity';

@Entity('positions')
@ObjectType()
export class Position {

  @Field(type => ID)
  @PrimaryGeneratedColumn()
  id?: number;

  @Field({ nullable: true })
  @Column('text', { nullable: true })
  title: string;
  
  @Field(type => Int)
  @Column('int',{ name: 'historical_index', nullable: true})
  historicalIndex?: number;
  
  @ManyToOne(type => Employee, employee => employee.positions)
  @JoinColumn({ name: 'employee_id', referencedColumnName: 'id' })
  employee: Employee;

  @Column('int', { name: 'employee_id' })
  employeeId: number;
  
  @Field(type => Department, { nullable: true })
  @ManyToOne(type => Department, department => department.positions, { nullable: true })
  @JoinColumn({ name: 'department_id', referencedColumnName: 'id' })
  department: Department;

  @Column('int', { name: 'department_id' })
  departmentId: number;

  // @Column('datetime')
  // createdAt: Date;
  
  // @Column('datetime')
  // updatedAt: Date;
}