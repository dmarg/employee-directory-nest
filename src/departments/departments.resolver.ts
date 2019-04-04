import { PositionsService } from './../positions/positions.service';
import { DepartmentsService, CreateDepartmentInput } from './departments.service';
import { Position } from 'src/positions/positions.entity';
import { Resolver, Query, Args, Mutation } from '@nestjs/graphql';
import { EmployeesService } from 'src/employees/employees.service';
import { Inject, forwardRef } from '@nestjs/common';
import { Department } from './departments.entity';

@Resolver('Departments')
export class DepartmentsResolver {
  constructor(private readonly departmentsService: DepartmentsService, @Inject(forwardRef(() => PositionsService)) private readonly positionsService: PositionsService) {}

  @Query(returns => [Department], {name: 'departments'})
  async departments(): Promise<Department[]> {
    return await this.departmentsService.findAll();
  }

  @Query(returns => Department, {name: 'department'})
  async department(@Args('id') id: number): Promise<Department> {
    return await this.departmentsService.findOne(id);
  }

  @Mutation(returns => Department)
  async addDepartment(@Args({ name: 'departmentInput', type: () => CreateDepartmentInput }) args: CreateDepartmentInput): Promise<Department> {
    const createdDepartment = await this.departmentsService.add(args);
    return createdDepartment;
  }

  @Mutation(returns => Boolean)
  async deleteDepartment(
    @Args({name: 'id', type: () => Number}) id: number,
  ): Promise<boolean> {
    const response = await this.departmentsService.delete(id);
    return response.affected > 0 ? true : false;
  }
}
