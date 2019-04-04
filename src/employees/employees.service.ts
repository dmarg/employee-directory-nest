import { Injectable, HttpException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Employee } from './employees.entity';
import { Repository, DeleteResult } from 'typeorm';
import { InputType, Field, Int } from 'type-graphql';

@InputType()
export class CreateEmployeeInput {
  @Field()
  firstName: string;

  @Field()
  lastName: string;

  @Field(type => Int)
  age: number;
}


@Injectable()
export class EmployeesService {
  constructor(
    @InjectRepository(Employee)
    private readonly employeeRepository: Repository<Employee>
  ) {}

  async getEmployees(): Promise<Employee[]> {
    return await this.employeeRepository.find();
  }

  async getEmployee(id: number): Promise<Employee> {
    let employee = await this.employeeRepository.findOne(id, { relations: ["positions"] });

    if (!employee) {
      throw new HttpException('Employee does not exist!', 404);
    } else {
      return employee;
    }
  }

  async addEmployee(employee: CreateEmployeeInput): Promise<Employee> {
    const _employee = this.employeeRepository.create(employee);
    return await this.employeeRepository.save(_employee);
  }

  async deleteEmployee(id: number): Promise<DeleteResult> {
    return await this.employeeRepository.createQueryBuilder().delete().where('id = :id', { id }).execute();
  }
}
