import { CreateEmployeeInput } from './../employees/employees.service';
import { Position } from './positions.entity';
import { Injectable, HttpException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, DeleteResult } from 'typeorm';
import { InputType, Field } from 'type-graphql';
import { Employee } from 'src/employees/employees.entity';

@InputType()
export class CreatePositionInput {
  @Field()
  title: string;

  @Field(type => CreateEmployeeInput)
  employee: CreateEmployeeInput
}

@Injectable()
export class PositionsService {
  constructor(
    @InjectRepository(Position)
    private readonly positionRepository: Repository<Position>
  ) {}

  async getPositions(): Promise<Position[]> {
    return await this.positionRepository.find();
  }

  async getPosition(id: number): Promise<Position> {
    let position = await this.positionRepository.findOne(id);

    if (!position) {
      throw new HttpException('Position does not exist!', 404);
    } else {
      return position;
    }
  }

  async addPosition(position: CreatePositionInput): Promise<CreatePositionInput> {
    const _position = this.positionRepository.create(position);
    return await this.positionRepository.save(_position);
  }

  async deletePosition(id: number): Promise<DeleteResult> {
    return await this.positionRepository.createQueryBuilder().delete().where('id = :id', { id }).execute();
  }
}
