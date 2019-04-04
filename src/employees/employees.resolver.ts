import { Int, ID } from 'type-graphql';
import { Args, Mutation, Query, Resolver, Subscription, ResolveProperty, Parent } from '@nestjs/graphql';
import { ParseIntPipe, UseGuards, Inject, forwardRef } from '@nestjs/common';
import { Employee } from './employees.entity';
import { EmployeesService, CreateEmployeeInput } from './employees.service';
import { Position } from 'src/positions/positions.entity';
import { PositionsService } from 'src/positions/positions.service';
import * as DataLoader from 'dataloader';


@Resolver(of => Employee)
export class EmployeesResolver {
  constructor(private readonly employeeService: EmployeesService, private readonly positionService: PositionsService) {}
  
  positionsLoader = new DataLoader((employeeIds: number[]) => {
    return this.positionService.loadPositionsByEmployees(employeeIds);
  });

  currentPositionLoader = new DataLoader((employeeIds: number[]) => {
    return this.positionService.loadCurrentPositionByEmployees(employeeIds);
  });

  @Query(returns => [Employee])
  async getEmployees(): Promise<Employee[]> {
    return await this.employeeService.getEmployees();
  }

  @Query(returns => Employee, { name: 'employee' })
  async getEmployee(@Args('id') id: number): Promise<Employee> {
    return await this.employeeService.getEmployee(id);
  }

  @ResolveProperty('positions')
  async positions(@Parent() employee) {
    return await this.positionsLoader.load(employee.id);
  }

  @ResolveProperty('currentPosition')
  async currentPosition(@Parent() employee) {
    return await this.currentPositionLoader.load(employee.id);
  }

  @Mutation(returns => Employee)
  async addEmployee(@Args({ name: 'employeeInput', type: () => CreateEmployeeInput }) args: CreateEmployeeInput): Promise<Employee> {
    const createdEmployee = await this.employeeService.addEmployee(args);
    return createdEmployee;
  }
  
  @Mutation(returns => Boolean)
  async deleteEmployee(
    @Args({name: 'id', type: () => Number}) id: number,
  ): Promise<boolean> {
    const response = await this.employeeService.deleteEmployee(id);
    return response.affected > 0 ? true : false;
  }

}
