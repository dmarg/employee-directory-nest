import { Department } from './departments.entity';
import { Injectable, HttpException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, DeleteResult, In } from 'typeorm';
import { InputType, Field, Int } from 'type-graphql';

@InputType()
export class CreateDepartmentInput {
  @Field()
  name: string;
}

@Injectable()
export class DepartmentsService {
  constructor(
    @InjectRepository(Department)
    private readonly departmentRepository: Repository<Department>
  ) {}

  async loadDepartmentsByIds(departmentIds: number[] ): Promise<Department[]> {
    let query = { where: { id: In(departmentIds) } };
    let departments = await this.findAll(query);

    return departmentIds.map(id => {
      return departments.find(d => d.id === id);
    });
  }

  async findAll(query: any = {}): Promise<Department[]> {
    return await this.departmentRepository.find(query);
  }

  async findOne(id: number): Promise<Department> {
    let department = await this.departmentRepository.findOne(id);

    if (!department) {
      throw new HttpException('Department does not exist!', 404);
    } else {
      return department;
    }
  }

  async add(department: CreateDepartmentInput): Promise<Department> {
    const _department = this.departmentRepository.create(department);
    return await this.departmentRepository.save(_department);
  }

  async delete(id: number): Promise<DeleteResult> {
    return await this.departmentRepository.createQueryBuilder().delete().where('id = :id', { id }).execute();
  }
}
