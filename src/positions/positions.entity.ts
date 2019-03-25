import { Employee } from './../employees/employees.entity';
import { Entity, Column, PrimaryGeneratedColumn, BeforeInsert, ManyToOne } from 'typeorm';
import { Field, ID, ObjectType, Int } from 'type-graphql';

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

  @ManyToOne(type => Employee, employee => employee.positions)
  employee: Employee;

  // @Column('datetime')
  // createdAt: Date;
  
  // @Column('datetime')
  // updatedAt: Date;
}