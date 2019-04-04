import { Employee } from './../employees/employees.entity';
import { Entity, Column, PrimaryGeneratedColumn, BeforeInsert, ManyToOne } from 'typeorm';
import { Field, ID, ObjectType, Int } from 'type-graphql';
import { Department } from 'src/departments/departments.entity';

@Entity()
@ObjectType()
export class Position {

  @Field(type => ID)
  @PrimaryGeneratedColumn()
  id?: number;

  @Field()
  @Column('text')
  title: string;
  
  @Field(type => Int)
  @Column({type: 'int'})
  historicalIndex?: number;
  
  @Column({type: 'int'})
  employeeId: number;

  @ManyToOne(type => Employee, employee => employee.positions)
  employee: Employee;

  @ManyToOne(type => Department, department => department.positions)
  department: Department;

  // @Column('datetime')
  // createdAt: Date;
  
  // @Column('datetime')
  // updatedAt: Date;
}