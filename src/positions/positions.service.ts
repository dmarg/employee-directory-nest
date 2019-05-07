import { CreateEmployeeInput } from './../employees/employees.service';
import { Position } from './positions.entity';
import { Injectable, HttpException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, DeleteResult, In } from 'typeorm';
import { InputType, Field, ID } from 'type-graphql';
import { Employee } from 'src/employees/employees.entity';

@InputType()
export class CreatePositionInput {
  @Field()
  title: string;

  @Field(type => ID)
  employeeId: number;
}

@Injectable()
export class PositionsService {
  constructor(
    @InjectRepository(Position)
    private readonly positionRepository: Repository<Position>,

    @InjectRepository(Employee)
    private readonly employeeRepository: Repository<Employee>
  ) {}

  async loadPositionsByEmployees(employeeIds: number[] ): Promise<Position[][]> {
    let query = { where: { employee_id: In(employeeIds) } };
    let positions = await this.getPositions(query)
    return employeeIds.map(id => {
      return positions.filter(p => p.employeeId === id);
    });
  }

  async loadCurrentPositionByEmployees(employeeIds: number[] ): Promise<Position[]> {
    let query = { where: { employee_id: In(employeeIds), historical_index: 1 } };
    let positions = await this.getPositions(query);
    return employeeIds.map(id => {
      return positions.find(p => {
        return p.employeeId === id;
      });
    });
  }

  async getPositions(query: any = {}): Promise<Position[]> {
    return await this.positionRepository.find(query);
  }

  async getPosition(id: number): Promise<Position> {
    let position = await this.positionRepository.findOne(id);

    if (!position) {
      throw new HttpException('Position does not exist!', 404);
    } else {
      return position;
    }
  }

  async addPosition(payload: CreatePositionInput): Promise<Position> {
    // const existingPositions = this.positionRepository
    let employee = await this.employeeRepository.findOne(payload.employeeId, { relations: ["positions"] });

    if (employee.id === Number(payload.employeeId)) {
      const position = this.positionRepository.create({...payload, historicalIndex: 1, employee: employee});
      return await this.positionRepository.save(position);  
    } else {
      throw new HttpException('Unprocessable Entity', 422);
    }
  }

  async deletePosition(id: number): Promise<DeleteResult> {
    return await this.positionRepository.createQueryBuilder().delete().where('id = :id', { id }).execute();
  }
}
