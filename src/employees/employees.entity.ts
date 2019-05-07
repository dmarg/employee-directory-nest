import { Entity, Column, PrimaryGeneratedColumn, BeforeInsert, OneToMany } from 'typeorm';
import { Field, ID, ObjectType, Int } from 'type-graphql';
import { Position } from 'src/positions/positions.entity';
import { type } from 'os';

@Entity('employees')
@ObjectType()
export class Employee {

  @Field(type => ID)
  @PrimaryGeneratedColumn()
  id?: number;

  @Field({ nullable: true })
  @Column('text', { name: 'first_name', nullable: true })
  firstName: string;

  @Field({ nullable: true })
  @Column('text', { name: 'last_name', nullable: true })
  lastName: string;
  
  @Field(type => Int)
  @Column('int', { nullable: true })
  age: number;
  
  @Field(type => [Position], { nullable: true })
  @OneToMany(type => Position, position => position.employee)
  positions?: Position[];
  
  @Field(type => Position, { nullable: true })
  currentPosition?: Position
  
  // @Column('datetime')
  // createdAt: Date;
  
  // @Column('datetime')
  // updatedAt: Date;
}