import { Entity, Column, PrimaryGeneratedColumn, BeforeInsert, OneToMany } from 'typeorm';
import { Field, ID, ObjectType, Int } from 'type-graphql';
import { Position } from 'src/positions/positions.entity';
import { type } from 'os';

@Entity('departments')
@ObjectType()
export class Department {

  @Field(type => ID)
  @PrimaryGeneratedColumn()
  id?: number;

  @Field({ nullable: true })
  @Column('text', { nullable: true })
  name: string;

  @Field(type => [Position], { nullable: true })
  @OneToMany(type => Position, position => position.employee)
  positions?: Position[];

  // @Column('datetime')
  // createdAt: Date;
  
  // @Column('datetime')
  // updatedAt: Date;
}