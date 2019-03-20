import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';
import { Field, ID, ObjectType, Int } from 'type-graphql';

@Entity()
@ObjectType()
export class Employee {

  @Field(type => ID)
  @PrimaryGeneratedColumn()
  id?: number;

  @Field()
  @Column('text')
  firstName: string;

  @Field()
  @Column('text')
  lastName: string;
  
  @Field(type => Int)
  @Column({type: 'int'})
  age: number;

  // @Column('datetime')
  // createdAt: Date;
  
  // @Column('datetime')
  // updatedAt: Date;
}