import { Entity, Column, PrimaryGeneratedColumn, BeforeInsert, OneToMany } from 'typeorm';
import { Field, ID, ObjectType, Int } from 'type-graphql';
import { Position } from 'src/positions/positions.entity';
import { type } from 'os';

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